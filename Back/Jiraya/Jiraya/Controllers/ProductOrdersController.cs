using AppApplication.Modules.ProductModule.Dtos;
using AppApplication.Modules.ProductModule.Extensions;
using AppApplication.Modules.ProductModule.Usecases;
using AppDomain.AppExceptions.Modules.ProductsModule;
using AppDomain.AppExceptions.Modules;
using AppDomain.AppExceptions;
using AppDomain.Modules.ProductsModule.Entities;
using Microsoft.AspNetCore.Mvc;
using AppApplication.Modules.UserModule.Extensions;
using AppApplication.Modules.UserModule.Usecases;
using AppDomain.Modules.UserModule.Entities;

namespace Jiraya.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductOrdersController : ControllerBase
    {
        private readonly CreateProductOrder _createProductOrder;
        private readonly GetProductOrder _getProductOrder;
        private readonly GetProduct _getProduct;
        private readonly GetCustomer _getCustomer;
        private readonly GetProductOrders _getProductOrders;
        private readonly UpdateProductOrder _updateProductOrder;
        private readonly DeleteProductOrder _deleteProductOrder;

        public ProductOrdersController(
            CreateProductOrder createProductOrder,
            GetProductOrder getProductOrder,
            GetProduct getProduct,
            GetCustomer getCustomer,
            GetProductOrders getProductOrders,
            UpdateProductOrder updateProductOrder,
            DeleteProductOrder deleteProductOrder
            )
        {
            _createProductOrder = createProductOrder;
            _getProductOrder = getProductOrder;
            _getProduct = getProduct;
            _getCustomer = getCustomer;
            _getProductOrders = getProductOrders;
            _updateProductOrder = updateProductOrder;
            _deleteProductOrder = deleteProductOrder;
        }

        [HttpPost]
        public async Task<ActionResult> CreateProductOrder([FromBody] CreateProductOrderDto product)
        {
            try
            {
                Product selectedProduct = await _getProduct.Handle(product.ProductId);
                Customer selectedCustomer = await _getCustomer.Handle(product.CustomerId);
                ProductOrder newProduct = new(product.Amount, product.TotalValue, selectedProduct,selectedCustomer);
                await _createProductOrder.Handle(newProduct);
                return Ok(newProduct.AsOrderDto());
            }
            catch (AppException exception)
            {
                if (exception is BaseException || exception is ProductException)
                {
                    return BadRequest(exception.Message);
                }
                else
                {
                    return StatusCode(500, exception.Message);
                }
            }
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetProductOrder(Guid id)
        {
            try
            {
                ProductOrder product = await _getProductOrder.Handle(id);
                if (product != null)
                {
                    return Ok(product.AsDto());
                }
                return NotFound("Produto não encontrado");
            }
            catch (AppException exception)
            {
                return BadRequest(exception.Message);
            }
            catch (Exception exception)
            {
                return StatusCode(500, exception.Message);
            }
        }

        [HttpPut]
        public async Task<ActionResult> UpdateProductOrder([FromBody] UpdateProductOrderDto product)
        {
            try
            {
                ProductOrder productOrderForUpdate = await _getProductOrder.Handle(product.Id);
                if (productOrderForUpdate != null)
                {
                    productOrderForUpdate.ChangeAmount(product.Amount);
                    productOrderForUpdate.ChangeTotalValue(product.TotalValue);
                    await _updateProductOrder.Handle(productOrderForUpdate);
                    ProductOrder updatedProduct = await _getProductOrder.Handle(product.Id);
                    return Ok(updatedProduct.AsDto());
                }
                else
                {
                    return NotFound("Pedido não encontrado");
                }
            }
            catch (AppException exception)
            {
                if (exception is BaseException || exception is ProductException)
                {
                    return BadRequest(exception.Message);
                }
                else
                {
                    return StatusCode(500, exception.Message);
                }
            }
        }

        [HttpGet]
        public async Task<ActionResult> GetProductOrders()
        {
            try
            {
                var productOrders = await _getProductOrders.Handle();
                var productOrdersDto = productOrders.Select(product => product.AsOrderDto()).ToList();
                return Ok(productOrdersDto);
            }
            catch (AppException exception)
            {
                return BadRequest(exception.Message);
            }
            catch (Exception exception)
            {
                return StatusCode(500, exception.Message);
            }
        }
        [HttpDelete]
        public async Task<ActionResult> DeleteProduct(Guid id)
        {
            try
            {
                ProductOrder currentProductOrder = await _getProductOrder.Handle(id);
                if (currentProductOrder != null)
                {
                    await _deleteProductOrder.Handle(id);
                    return Ok(id);
                }
                return NotFound("Pedido não encontrado");
            }
            catch (AppException exception)
            {
                return BadRequest(exception.Message);
            }
            catch (Exception exception)
            {
                return StatusCode(500, exception.Message);
            }
        }
    }
}

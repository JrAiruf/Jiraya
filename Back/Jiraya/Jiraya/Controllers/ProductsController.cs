using AppApplication.Modules.ProductModule.Dtos;
using AppApplication.Modules.ProductModule.Extensions;
using AppApplication.Modules.ProductModule.Usecases;
using AppDomain.AppExceptions;
using AppDomain.AppExceptions.Modules;
using AppDomain.AppExceptions.Modules.ProductsModule;
using AppDomain.Modules.ProductsModule.Entities;
using Microsoft.AspNetCore.Mvc;

namespace Jiraya.API.Controllers
{
    [ApiController]
    [Route("/api/[controller]")]
    public class ProductsController : ControllerBase
    {
        private readonly CreateProduct _createProduct;
        private readonly UploadProductImage _uploadProductImage;
        private readonly GetProduct _getProduct;
        private readonly GetProducts _getProducts;
        private readonly UpdateProduct _updateProduct;
        private readonly DeleteProduct _deleteProduct;
        public ProductsController(
            CreateProduct createProduct,
            UploadProductImage uploadProductImage,
            GetProduct getProduct,
            GetProducts getProducts,
            UpdateProduct updateProduct,
            DeleteProduct deleteProduct)
        {
            _createProduct = createProduct;
            _uploadProductImage = uploadProductImage;
            _getProduct = getProduct;
            _getProducts = getProducts;
            _updateProduct = updateProduct;
            _deleteProduct = deleteProduct;
        }

        [HttpPost]
        public async Task<ActionResult> CreateProduct([FromBody] CreateProductDto product)
        {
            try
            {
                product.Ingredients.ToList().ForEach(item => item.Concat(","));
                Product newProduct = new(product.Name,product.Price,product.Ingredients);
                if(product.ProductImage != null)
                {
                    ProductImage productImage = new(product.ProductImage.UrlPath,newProduct.Id);
                    await _uploadProductImage.Handle(productImage);
                }
                await _createProduct.Handle(newProduct);
                return StatusCode(201,newProduct.AsDto());
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
        public async Task<ActionResult> GetProduct(Guid id)
        {
            try
            {
                Product product = await _getProduct.Handle(id);
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
        public async Task<ActionResult> UpdateProduct([FromBody] UpdateProductDto product)
        {
            try
            {
                Product productForUpdate = await _getProduct.Handle(product.Id);
                if (productForUpdate != null)
                {
                    productForUpdate.ChangeName(product.Name);
                    productForUpdate.ChangePrice(product.Price);
                    productForUpdate.ChangeIngredients(product.Ingredients);
                    await _updateProduct.Handle(productForUpdate);
                    Product updatedProduct = await _getProduct.Handle(product.Id);
                    return Ok(updatedProduct.AsDto());
                }
                else
                {
                    return NotFound("Produto não encontrado");
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
        public async Task<ActionResult> GetProducts()
        {
            try
            {
                var products = await _getProducts.Handle();
                var productsDto = products.Select(product => product.AsDto()).ToList();
                return Ok(productsDto);
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
                Product currentProduct = await _getProduct.Handle(id);
                if(currentProduct != null)
                {
                await _deleteProduct.Handle(id);
                return Ok(id);
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
    }
}

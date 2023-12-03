using AppApplication.Modules.ProductModule.Dtos;
using AppApplication.Modules.ProductModule.Usecases;
using AppDomain.Modules.ProductsModule.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Jiraya.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductImagesController : ControllerBase
    {
        private readonly GetProduct _getProduct;
        private readonly UpdateProduct _updateProduct;
        private readonly UploadProductImage _uploadProductImage;
        private readonly UpdateProductImage _updateProductImage;
        private readonly DeleteProductImage _deleteProductImage;
        private readonly IWebHostEnvironment _hostEnvironment;

        public ProductImagesController(
            GetProduct getProduct,
            UpdateProduct updateProduct,
            UploadProductImage uploadProductImage,
            UpdateProductImage updateProductImage,
            DeleteProductImage deleteProductImage,
            IWebHostEnvironment hostEnvironment)
        {
            _getProduct = getProduct;
            _updateProduct = updateProduct;
            _uploadProductImage = uploadProductImage;
            _updateProductImage = updateProductImage;
            _deleteProductImage = deleteProductImage;
            _hostEnvironment = hostEnvironment;
        }

        [HttpPost("upload")]
        public async Task<ActionResult> UploadProductImage(UploadProductImageDto productImage)
        {
            try
            {
                ProductImage newProductImage = new();
                Product selectedProduct = await _getProduct.Handle(productImage.ProductId);
                if (selectedProduct != null)
                {
                    var newFile = Request.Form.Files.First();
                    if (newFile != null)
                    {
                        DeleteLocalImage(productImage.UrlPath);
                        var imageName = await SaveLocalImage(newFile);
                        newProductImage.ChangeUrlPath(imageName);
                        selectedProduct.ChangeImage(newProductImage);
                        await _updateProduct.Handle(selectedProduct);
                    }
                }
                return Ok("");
            }
            catch (Exception exception)
            {
                return StatusCode(500, exception.Message);
            }
        }
        [HttpPut]
        public async Task<ActionResult> UpdateProductImage(UpdateProductImageDto productImage)
        {
            return Ok("");
        }
        [HttpDelete]
        public async Task<ActionResult> DeleteProductImage(UpdateProductImageDto productImage)
        {
            return Ok("");
        }
        [NonAction]
        private async Task<string> SaveLocalImage(IFormFile imageFile)
        {
            var productImageName = new String(
                Path.GetFileNameWithoutExtension(imageFile.FileName).
                Take(10).
                ToArray()).
                Replace(" ", "-");

            productImageName = $"{productImageName}{DateTime.UtcNow.ToString("yymmssfff")}{Path.GetExtension(imageFile.FileName)}";
             
            var productImagePath = Path.Combine(_hostEnvironment.ContentRootPath, @"Resources/images",productImageName);
            using (var fileStream = new FileStream(productImagePath, FileMode.Create))
            {
                await imageFile.CopyToAsync(fileStream);
            }
                return productImageName;
        }
        [NonAction]
        private void DeleteLocalImage(string imageUrlPath)
        {
            var productImagePath = Path.Combine(_hostEnvironment.ContentRootPath, @"Resources/images", imageUrlPath);
            if (System.IO.File.Exists(productImagePath))
            {
                System.IO.File.Delete(productImagePath);
            }
        }
    }
}

using AppDomain.Modules.ProductsModule.Entities;

namespace AppInfra.Contracts
{
    public interface IProductRepository
    {
        public Task CreateProductAsync(Product product);
        public Task<List<Product>> GetProductsAsync();
        public Task<Product> GetProductAsync(Guid id);
        public Task UpdateProductAsync(Product product);
        public Task DeleteProductAsync(Guid id);
        public Task CreateProductOrderAsync(ProductOrder product);
        public Task<List<ProductOrder>> GetProductOrdersAsync();
        public Task<ProductOrder> GetProductOrderAsync(Guid id);
        public Task UpdateProductOrderAsync(ProductOrder product);
        public Task DeleteProductOrderAsync(Guid id);
        public Task UploadProductImage(ProductImage productImage);
        public Task UpdateProductImage(ProductImage productImage);
        public Task DeleteProductImage(Guid id);
    }
}

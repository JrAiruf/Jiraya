namespace AppApplication.Modules.ProductModule.Dtos
{
    public class ProductImageDto
    {
        public ProductImageDto(Guid id, string urlPath, Guid productId)
        {
            Id = id;
            UrlPath = urlPath;
            ProductId = productId;
        }

        public Guid Id { get; private set; }
        public string UrlPath { get; private set; }
        public Guid ProductId { get; private set; }
    }
}

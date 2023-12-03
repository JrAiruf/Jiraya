namespace AppApplication.Modules.ProductModule.Dtos
{
    public class UploadProductImageDto
    {
        public UploadProductImageDto(string urlPath, Guid productId)
        {
            UrlPath = urlPath;
            ProductId = productId;
        }
        public string UrlPath { get; private set; }
        public Guid ProductId { get; private set; }
    }
}

namespace AppApplication.Modules.ProductModule.Dtos
{
    public class UpdateProductImageDto
    {
        public UpdateProductImageDto(Guid id, string urlPath)
        {
            Id = id;
            UrlPath = urlPath;
        }

        public Guid Id { get; private set; }
        public string UrlPath { get; private set; }
    }
}

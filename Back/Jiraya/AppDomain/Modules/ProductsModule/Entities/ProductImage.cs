using System.ComponentModel.DataAnnotations.Schema;

namespace AppDomain.Modules.ProductsModule.Entities
{
    public class ProductImage : BaseEntity
    {
        public ProductImage(string urlPath,Guid productId)
        {
            ChangeUrlPath(urlPath);
            ProductId = productId;
        }
        public string UrlPath { get; private set; }
        [ForeignKey("Product")]
        public Guid ProductId { get; private set; }
        public Product Product { get; private set; }

        public void ChangeUrlPath(string urlPath)
        {
            if (string.IsNullOrEmpty(urlPath))
            {
                throw new Exception("A URL da imagem não pode ser vazia ou nula.");
            }
            UrlPath = urlPath;
        }
        public ProductImage() { }
    }
}

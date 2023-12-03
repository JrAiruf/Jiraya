using AppDomain.Modules.ProductsModule.Entities;
using AppInfra.Contracts;

namespace AppApplication.Modules.ProductModule.Usecases
{
    public class UploadProductImage
    {
        private readonly IProductRepository _repository;
        public UploadProductImage(IProductRepository repository)
        {
            _repository = repository;
        }

        public async Task Handle(ProductImage productImage)
        {
            await _repository.UploadProductImage(productImage);
        }
    }
}

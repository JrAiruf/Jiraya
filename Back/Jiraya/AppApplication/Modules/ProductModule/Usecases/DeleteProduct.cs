using AppInfra.Contracts;

namespace AppApplication.Modules.ProductModule.Usecases
{
    public class DeleteProduct
    {
        private readonly IProductRepository _repository;
        public DeleteProduct(IProductRepository repository)
        {
            _repository = repository;
        }

        public async Task Handle(Guid id)
        {
            await _repository.DeleteProductAsync(id);
        }
    }
}

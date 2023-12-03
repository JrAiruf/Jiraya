using AppInfra.Contracts;

namespace AppApplication.Modules.ProductModule.Usecases
{
    public class DeleteProductImage
    {
        private readonly IProductRepository _repository;
        public DeleteProductImage(IProductRepository repository)
        {
            _repository = repository;
        }

        public async Task Handle(Guid id)
        {
            await _repository.DeleteProductImage(id);
        }
    }
}

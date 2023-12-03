using AppApplication.Modules.ProductModule.Usecases;
using AppApplication.Modules.UserModule.Usecases;

namespace Jiraya.API
{
    public class AppUsecaseContainer
    {
        private readonly WebApplicationBuilder _builder;
        public AppUsecaseContainer(WebApplicationBuilder builder)
        {
            _builder = builder;
        }
        public void InitUser()
        {
            _builder.Services.AddTransient<CreateUser>();
            _builder.Services.AddTransient<GetUser>();
            _builder.Services.AddTransient<GetUsers>();
            _builder.Services.AddTransient<UpdateUser>();
            _builder.Services.AddTransient<DeleteUser>();
        }
        public void InitCustomer()
        {
            _builder.Services.AddTransient<CreateCustomer>();
            _builder.Services.AddTransient<GetCustomer>();
            _builder.Services.AddTransient<GetCustomers>();
            _builder.Services.AddTransient<UpdateCustomer>();
            _builder.Services.AddTransient<UpdateAddress>();
            _builder.Services.AddTransient<DeleteCustomer>();
        }
        public void InitProduct()
        {
            _builder.Services.AddTransient<CreateProduct>();
            _builder.Services.AddTransient<GetProduct>();
            _builder.Services.AddTransient<GetProducts>();
            _builder.Services.AddTransient<UpdateProduct>();
            _builder.Services.AddTransient<DeleteProduct>();
        }
        public void InitProductOrder()
        {
            _builder.Services.AddTransient<CreateProductOrder>();
            _builder.Services.AddTransient<GetProductOrder>();
            _builder.Services.AddTransient<GetProductOrders>();
            _builder.Services.AddTransient<UpdateProductOrder>();
            _builder.Services.AddTransient<DeleteProductOrder>();
        }
        public void InitProductImage()
        {
            _builder.Services.AddTransient<UploadProductImage>();
            _builder.Services.AddTransient<UpdateProductImage>();
            _builder.Services.AddTransient<DeleteProductImage>();
        }
    }
}

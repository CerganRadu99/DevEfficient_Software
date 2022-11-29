using Application.Interfaces;
using DevEfficientAPI.MockData;
using Domain.Dtos;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApi.Controllers;
using Xunit;

namespace DevEfficientAPI.System.Controllers
{
    public class TestItemsController
    {

        [Fact]
        public void GetItems_ShouldReturnListOf3Items()
        {
            GetItemsBodyModel requestBody = new GetItemsBodyModel
            {
                SearchTerm = "",
                FilterField = "",
                FilterValue = ""
            };
            //Arrange
            var itemsService = new Mock<IItemService>();
            itemsService.As<IItemService>().Setup(_ => _.GetAll(requestBody)).Returns(ItemsMockData.GetItems());
            var itemsController = new ItemsController(itemsService.Object);

            //Act
            var result = itemsController.GetItems(requestBody);

            //Assert
#pragma warning disable CS8602 // Dereference of a possibly null reference.
            var items = result.Value.Data.ToList();
#pragma warning restore CS8602 // Dereference of a possibly null reference.
            Assert.True(items.Count == 3);
        }
    }
}

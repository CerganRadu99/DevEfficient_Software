using Domain.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DevEfficientAPI.MockData
{
    public class ItemsMockData
    {
        public static async Task<IEnumerable<RetrievedItemDto>> GetItems()
        {
            List<RetrievedItemDto> returnedList = new List<RetrievedItemDto>();
            returnedList.Add(new RetrievedItemDto
            {
                Id = Guid.NewGuid(),
                Title = "Implement cache mechanism",
                Priority = "Low",
                EstimatedHours = 3,
                Effort = "M",
                State = "ToDo",
                Type = "Task"
            });
            returnedList.Add(new RetrievedItemDto
            {
                Id = Guid.NewGuid(),
                Title = "Implement authorization mechanism",
                Priority = "Medium",
                EstimatedHours = 5,
                Effort = "L",
                State = "ToDo",
                Type = "Task"
            });
            returnedList.Add(new RetrievedItemDto
            {
                Id = Guid.NewGuid(),
                Title = "Fix logging issue",
                Priority = "High",
                EstimatedHours = 3,
                Effort = "S",
                State = "ToDo",
                Type = "Bug"
            });
            return await Task.FromResult(returnedList);
        }
    }
}

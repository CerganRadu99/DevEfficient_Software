using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Validation;

namespace WebApi.Dtos
{
    public class ResponseDto<T> where T : class
    {
        public bool Succeeded { get; set; }
        public List<string> Errors { get; set; }
        public T Data { get; set; }

        internal ResponseDto(bool succeeded, List<string> errors, T data)
        {
            Succeeded = succeeded;
            Errors = errors;
            Data = data;
        }

        public static ResponseDto<T> Success(T data)
        {
            return new ResponseDto<T>(true, new List<string> { }, data);
        }
        public static ResponseDto<T> Failure(List<string> errors)
        {
            return new ResponseDto<T>(false, errors, null);
        }
        public static ResponseDto<T> NotFound()
        {
            return new ResponseDto<T>(false, new List<string> { DefaultErrors.NotFoundError }, null);
        }

        public static ResponseDto<T> BadRequest()
        {
            return new ResponseDto<T>(false, new List<string> { DefaultErrors.BadRequestError }, null);
        }

        public bool EntityNotFound()
        {
            return Errors.Contains(DefaultErrors.NotFoundError);
        }
    }

    public class ResponseDto
    {
        public bool Succeeded { get; set; }
        public List<string> Errors { get; set; }

        internal ResponseDto(bool succeeded, List<string> errors)
        {
            Succeeded = succeeded;
            Errors = errors;
        }

        public static ResponseDto Success()
        {
            return new ResponseDto(true, new List<string> { });
        }

        public static ResponseDto Failure(List<string> errors)
        {
            return new ResponseDto(false, errors);
        }

        public static ResponseDto NotFound()
        {
            return new ResponseDto(false, new List<string> { DefaultErrors.NotFoundError });
        }

        public bool EntityNotFound()
        {
            return Errors.Contains(DefaultErrors.NotFoundError);
        }
    }
}

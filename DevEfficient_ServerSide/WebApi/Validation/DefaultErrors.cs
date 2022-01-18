using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Validation
{
    public static class DefaultErrors
    {
        public const string NotFoundError = "not_found_error";
        public const string BadRequestError = "bad_request_error";

        public static List<string> GetErrors(params string[] errors)
        {
            var result = new List<string>();
            foreach (var error in errors)
            {
                result.Add(error);
            }
            return result;
        }
        public static List<string> GetErrors(List<string> existingErrors, params string[] errors)
        {
            var result = new List<string>();
            result.AddRange(existingErrors);

            foreach (var error in errors)
            {
                result.Add(error);
            }
            return result;
        }
    }
}

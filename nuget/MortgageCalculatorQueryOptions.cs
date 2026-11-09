using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.MortgageCalculator
{
    /// <summary>
    /// Query options for the Mortgage Calculator API
    /// </summary>
    public class MortgageCalculatorQueryOptions
    {
        /// <summary>
        /// The loan amount
        /// </summary>
        [JsonProperty("amount")]
        public double Amount { get; set; }

        /// <summary>
        /// The interest rate (percentage)
        /// </summary>
        [JsonProperty("rate")]
        public double Rate { get; set; }

        /// <summary>
        /// The loan term in years
        /// </summary>
        [JsonProperty("years")]
        public int Years { get; set; }

        /// <summary>
        /// The down payment amount
        /// </summary>
        [JsonProperty("downpayment")]
        public double? Downpayment { get; set; }

        /// <summary>
        /// The annual property tax amount
        /// </summary>
        [JsonProperty("annual_propertytax")]
        public double? Annual_propertytax { get; set; }

        /// <summary>
        /// The annual home insurance amount
        /// </summary>
        [JsonProperty("annual_homeinsurance")]
        public double? Annual_homeinsurance { get; set; }

        /// <summary>
        /// The annual HOA amount
        /// </summary>
        [JsonProperty("annual_hoa")]
        public double? Annual_hoa { get; set; }

        /// <summary>
        /// Annual private mortgage insurance rate as a percentage of the loan, charged only when the loan-to-value ratio is above 80%
        /// </summary>
        [JsonProperty("pmi_rate")]
        public double? Pmi_rate { get; set; }

        /// <summary>
        /// Extra principal paid every month, to see how much sooner the loan is paid off and how much interest that saves
        /// </summary>
        [JsonProperty("extra_monthly")]
        public double? Extra_monthly { get; set; }

        /// <summary>
        /// Loan start (closing) date; the first payment falls the following month
        /// </summary>
        [JsonProperty("start_date")]
        public string Start_date { get; set; }
    }
}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Carbon\CarbonPeriod;
use Illuminate\Support\Facades\Http;

class MainController extends Controller
{
    function index(){
        $country = DB::table('ApiCountries')->get();
		$currency = DB::table('ApiCurrencies')->get();
		
		return view('main')
		->with('data', [$country, $currency]);
    }

    function populateCountry(){
        
        /** supported currencies */
        $supportedCurrencies = json_decode('{
			"AED": "United Arab Emirates",
			"AFN": "Afghanistan",
			"ALL": "Albania",
			"AMD": "Armenia",
			"ANG": "Curaçao",
			"AOA": "Angola",
			"ARS": "Argentina",
			"AUD": "Australia",
			"AWG": "Aruba",
			"AZN": "Azerbaijan",
			"BAM": "Bosnia and Herzegovina",
			"BBD": "Barbados",
			"BDT": "Bangladesh",
			"BGN": "Bulgaria",
			"BHD": "Bahrain",
			"BIF": "Burundi",
			"BMD": "Bermuda",
			"BND": "Brunei",
			"BOB": "Bolivia",
			"BRL": "Brazil",
			"BSD": "Bahamas",
			"BTN": "Bhutan",
			"BWP": "Botswana",
			"BYN": "Belarus",
			"BZD": "Belize",
			"CAD": "Canada",
			"CDF": "Democratic Republic of the Congo",
			"CHF": "Switzerland",
			"CLP": "Chile",
			"CNY": "China",
			"COP": "Colombia",
			"CRC": "Costa Rica",
			"CUC": "Cuba",
			"CUP": "Cuba",
			"CVE": "Cabo Verde",
			"CZK": "Czechia",
			"DJF": "Djibouti",
			"DKK": "Denmark",
			"DOP": "Dominican Republic",
			"DZD": "Algeria",
			"EGP": "Egypt",
			"ERN": "Eritrea",
			"ETB": "Ethiopia",
			"EUR": "Åland Islands",
			"FJD": "Fiji",
			"FKP": "Falkland Islands",
			"GBP": "United Kingdom",
			"GEL": "Georgia",
			"GHS": "Ghana",
			"GIP": "Gibraltar",
			"GMD": "Gambia",
			"GNF": "Guinea",
			"GTQ": "Guatemala",
			"GYD": "Guyana",
			"HKD": "Hong Kong",
			"HNL": "Honduras",
			"HRK": "Croatia",
			"HTG": "Haiti",
			"HUF": "Hungary",
			"IDR": "Indonesia",
			"ILS": "Israel",
			"INR": "India",
			"IQD": "Iraq",
			"IRR": "Iran",
			"ISK": "Iceland",
			"JMD": "Jamaica",
			"JOD": "Jordan",
			"JPY": "Japan",
			"KES": "Kenya",
			"KGS": "Kyrgyzstan",
			"KHR": "Cambodia",
			"KMF": "Comoros",
			"KPW": "North Korea",
			"KRW": "South Korea",
			"KWD": "Kuwait",
			"KYD": "Cayman Islands",
			"KZT": "Kazakhstan",
			"LAK": "Laos",
			"LBP": "Lebanon",
			"LKR": "Sri Lanka",
			"LRD": "Liberia",
			"LSL": "Lesotho",
			"LYD": "Libya",
			"MAD": "Morocco",
			"MDL": "Moldova",
			"MGA": "Madagascar",
			"MKD": "North Macedonia",
			"MMK": "Myanmar",
			"MNT": "Mongolia",
			"MOP": "Macau",
			"MRU": "Mauritania",
			"MUR": "Mauritius",
			"MVR": "Maldives",
			"MWK": "Malawi",
			"MXN": "Mexico",
			"MYR": "Malaysia",
			"MZN": "Mozambique",
			"NAD": "Namibia",
			"NGN": "Nigeria",
			"NIO": "Nicaragua",
			"NOK": "Norway",
			"NPR": "Nepal",
			"NZD": "New Zealand",
			"OMR": "Oman",
			"PAB": "Panama",
			"PEN": "Peru",
			"PGK": "Papua New Guinea",
			"PHP": "Philippines",
			"PKR": "Pakistan",
			"PLN": "Poland",
			"PYG": "Paraguay",
			"QAR": "Qatar",
			"RON": "Romania",
			"RSD": "Serbia",
			"RUB": "Russia",
			"RWF": "Rwanda",
			"SAR": "Saudi Arabia",
			"SBD": "Solomon Islands",
			"SCR": "Seychelles",
			"SDG": "Sudan",
			"SEK": "Sweden",
			"SGD": "Singapore",
			"SHP": "Saint Helena",
			"SLL": "Sierra Leone",
			"SOS": "Somalia",
			"SRD": "Suriname",
			"STN": "São Tomé and Príncipe",
			"SVC": "El Salvador",
			"SYP": "Syria",
			"SZL": "Eswatini",
			"THB": "Thailand",
			"TJS": "Tajikistan",
			"TMT": "Turkmenistan",
			"TND": "Tunisia",
			"TOP": "Tonga",
			"TRY": "Turkey",
			"TTD": "Trinidad and Tobago",
			"TWD": "Taiwan",
			"TZS": "Tanzania",
			"UAH": "Ukraine",
			"UGX": "Uganda",
			"USD": "United States",
			"UYU": "Uruguay",
			"UZS": "Uzbekistan",
			"VES": "Venezuela",
			"VND": "Vietnam",
			"VUV": "Vanuatu",
			"WST": "Samoa",
			"XAF": "Cameroon",
			"XCD": "Anguilla",
			"XDR": "International Monetary Fund",
			"XOF": "Benin",
			"XPF": "French territories of the Pacific Ocean: French Polynesia",
			"YER": "Yemen",
			"ZAR": "Lesotho",
			"ZMW": "Zambia"
		}',true);

        /** populate db table with currency and its assosiated country*/
        // https://currencyscoop.com/supported-currencies
        foreach($supportedCurrencies as $currency_name => $country_name){
            try {
			    DB::insert('INSERT INTO ApiCountries (id, name) VALUES (?, ?)', [$currency_name, $country_name]);
            } catch (\Throwable $th) {
                // skip
            }
		}

        return back();
    }

    function populateCurrency(Request $request){
        
        /** date range */
        $period = new CarbonPeriod($request->from, '1 day', $request->to);
        
        /** dates in DB */
		$indb = array_map(function ($value) {
			return $value->date;
		}, DB::SELECT('SELECT date FROM ApiCurrencies GROUP BY date'));

        /** populating table */
		foreach($period as $date){
			// https://api.currencyscoop.com/v1/historical?date=2021-03-03&api_key=5589033c33325a1a05e773a3f89ca5b1
			$response = Http::get('https://api.currencyscoop.com/v1/historical', [
				'api_key' => config('API_KEY', '71a4ce4e26df9af844e52aa1faf2587e'),
				'date' => $date->format('Y-m-d'),
			]);
			
			$rates = json_decode($response->body(), true)['response']['rates'];
			foreach($rates as $name => $value){
				/** ingresar currencies */
				try {
					if(!in_array($date->format('Y-m-d'), $indb)){
						DB::insert('INSERT INTO ApiCurrencies (name, value, date) VALUES (?, ?, ?)', [$name, $value, $date->format('Y-m-d')]);
					}
				} catch (\Throwable $th) {
					//skip
				}
			}
		}
		

        return back();
    }
}

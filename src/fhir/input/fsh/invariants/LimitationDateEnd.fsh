Invariant: -limitationDateEnd
Description: "Limitation of the date format to 10 characters YYYY-MM-DD"
* severity = #error
* expression = "end.exists().not() or end.toString().length()=10"
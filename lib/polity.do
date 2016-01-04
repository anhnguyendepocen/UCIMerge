* 2014 Polity 4
* http://www.systemicpeace.org/polity/polity4.htm

local URL "http://www.systemicpeace.org/inscr/p4v2014.xls"
local PREFIX "polity"
local YEARVAR "year"
local COUNTRYVAR "ccode"
local MERGEWITH "Polity"
local MERGEUSING "Numeric"

tempfile merge
prep_mergefile `MERGEWITH' `MERGEUSING' `merge'

* If the file source file doesn't already exist then download and create it.
use_or_import_source_excel `PREFIX' `URL'

* Fixes:
drop if year == .
* Drop Sudan Transition
drop if cyear == 6252011
* Drop Ethiopian Transition
drop if cyear == 5301993
* Drop Vietnam Transition
drop if cyear == 8161976

prefix `PREFIX'

merge_ids `PREFIX' `YEARVAR' `COUNTRYVAR' `MERGEUSING' `merge'

* Merge with the dataset
merge_with_master

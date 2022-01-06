Instance: example-questionnaireresponse
InstanceOf: QuestionnaireResponse
Usage: #example
Description: "Example questionnaire"
Title:    "Example questionnaire"

* meta.profile = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaireresponse|2.7"

* status = #completed
* authored = "2022-01-06T10:58:49.676Z"
* item[+].linkId = "age"
* item[=].text = "Patient Age"
* item[=].answer[+].valueCoding.code = #0-44
* item[=].answer[=].valueCoding.display = "0 to 44 years old"

* item[+].linkId = "bmi"
* item[=].text = "Patient BMI"
* item[=].answer[+].valueCoding.code = #0-25
* item[=].answer[=].valueCoding.display = "0 to 25 km/m2"

* item[+].linkId = "waistcircumference"
* item[=].text = "Waist circumference"
* item[=].answer[+].valueCoding.code = #0-93
* item[=].answer[=].valueCoding.display = "Below 93 cm"

* item[+].linkId = "physicalActivity"
* item[=].text = "Physical Activity?"
* item[=].answer[+].valueCoding.code = #yes
* item[=].answer[=].valueCoding.display = "Yes"

* item[+].linkId = "fruitsvegs"
* item[=].text = "Daily consumption of fruits and vegetables?"
* item[=].answer[+].valueCoding.code = #yes
* item[=].answer[=].valueCoding.display = "more than 5 times a day"

* item[+].linkId = "BPmeds"
* item[=].text = "History of high Blood pressure meds?"
* item[=].answer[+].valueCoding.code = #no
* item[=].answer[=].valueCoding.display = "No"

* item[+].linkId = "histHyperglicemia"
* item[=].text = "History of high blood glucose?"
* item[=].answer[+].valueCoding.code = #no
* item[=].answer[=].valueCoding.display = "No"

* item[+].linkId = "familyHistDiabetes"
* item[=].text = "Family history of diabetes?"
* item[=].answer[+].valueCoding.code = #no
* item[=].answer[=].valueCoding.display = "No family history"


* item[+].linkId = "findriscScore"
* item[=].text = "Patient FINDRISC total score"
* item[=].answer[+].valueDecimal  = 0


Instance: example-observation
InstanceOf: Observation
Usage: #example
Description: "Example observation"
Title:    "Example observation"

* status = #final

* code = http://snomed.info/sct#763117005 "FINDRISC (Finnish Diabetes Risk Score) score"

* subject.identifier.value = "0"
* valueInteger = 0
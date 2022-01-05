Instance: findrisc-questionnaire2
InstanceOf: Questionnaire
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2021-12-15T22:17:42.861+00:00"
* meta.source = "#qsuskzFpRkki1som"
* language = #en
* extension[0].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-targetStructureMap"
* extension[=].valueCanonical = "http://hl7belgium.org/mapping/StructureMap/extractfindrisc"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "scoreExt"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "'http://hl7.org/fhir/StructureDefinition/ordinalValue'"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "ageValue"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "%questionnaire.item.where(linkId = 'age').answerOption.where(valueCoding.code=%resource.item.where(linkId = 'age').answer.valueCoding.code).extension.where(url=%scoreExt).valueDecimal"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "bmiValue"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "%questionnaire.item.where(linkId = 'bmi').answerOption.where(valueCoding.code=%resource.item.where(linkId = 'bmi').answer.valueCoding.code).extension.where(url=%scoreExt).valueDecimal"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "waistcircumferenceValue"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "%questionnaire.item.where(linkId = 'waistcircumference').answerOption.where(valueCoding.code=%resource.item.where(linkId = 'waistcircumference').answer.valueCoding.code).extension.where(url=%scoreExt).valueDecimal"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "physicalActivityValue"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "%questionnaire.item.where(linkId = 'physicalActivity').answerOption.where(valueCoding.code=%resource.item.where(linkId = 'physicalActivity').answer.valueCoding.code).extension.where(url=%scoreExt).valueDecimal"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "fruitsvegsValue"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "%questionnaire.item.where(linkId = 'fruitsvegs').answerOption.where(valueCoding.code=%resource.item.where(linkId = 'fruitsvegs').answer.valueCoding.code).extension.where(url=%scoreExt).valueDecimal"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "BPmedsValue"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "%questionnaire.item.where(linkId = 'BPmeds').answerOption.where(valueCoding.code=%resource.item.where(linkId = 'BPmeds').answer.valueCoding.code).extension.where(url=%scoreExt).valueDecimal"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "histHyperglicemiaValue"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "%questionnaire.item.where(linkId = 'histHyperglicemia').answerOption.where(valueCoding.code=%resource.item.where(linkId = 'histHyperglicemia').answer.valueCoding.code).extension.where(url=%scoreExt).valueDecimal"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "familyHistDiabetesValue"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "%questionnaire.item.where(linkId = 'familyHistDiabetes').answerOption.where(valueCoding.code=%resource.item.where(linkId = 'familyHistDiabetes').answer.valueCoding.code).extension.where(url=%scoreExt).valueDecimal"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "allQuestionsAnswered"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "%ageValue.exists() and %bmiValue.exists() and %waistcircumferenceValue.exists() and %physicalActivityValue.exists() and %fruitsvegsValue.exists() and %BPmedsValue.exists() and %histHyperglicemiaValue.exists() and %familyHistDiabetesValue.exists()"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "finalScore"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "iif(%allQuestionsAnswered, iif(%ageValue.exists(), %ageValue, 0) + iif(%bmiValue.exists(), %bmiValue, 0) + iif(%waistcircumferenceValue.exists(), %waistcircumferenceValue, 0) + iif(%physicalActivityValue.exists(), %physicalActivityValue, 0) + iif(%fruitsvegsValue.exists(), %fruitsvegsValue, 0) + iif(%BPmedsValue.exists(), %BPmedsValue, 0) + iif(%histHyperglicemiaValue.exists(), %histHyperglicemiaValue, 0) + iif(%familyHistDiabetesValue.exists(), %familyHistDiabetesValue, 0), {})"
* url = "http://hl7belgium.org/mapping/Questionnaire/findrisc-questionnaire"
* version = "0.1.0"
* name = "FINDRISCQuestionnaire"
* title = "FINDRISC Test Questionnaire"
* status = #draft
* subjectType = #Patient
* date = "2021-09-13T12:47:54+00:00"
* publisher = "RIZIV-INAMI"
* contact.telecom.system = #url
* contact.telecom.value = "http://somewhere.org"
* jurisdiction.coding[0] = http://unstats.un.org/unsd/methods/m49/m49.htm#056
* jurisdiction.coding[+] = urn:iso:std:iso:3166#BE
* item[0].linkId = "title"
* item[=].text = "FINDRISC Test"
* item[=].type = #display
* item[=].required = false
* item[+].linkId = "age"
* item[=].text = "Patient Age"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[0].extension.url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* item[=].answerOption[=].extension.valueDecimal = 0
* item[=].answerOption[=].valueCoding = #0-44 "0 to 44 years old"
* item[=].answerOption[+].extension.url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* item[=].answerOption[=].extension.valueDecimal = 2
* item[=].answerOption[=].valueCoding = #45-54 "45 to 54 years old"
* item[=].answerOption[+].extension.url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* item[=].answerOption[=].extension.valueDecimal = 3
* item[=].answerOption[=].valueCoding = #55-64 "55 to 64 years old"
* item[=].answerOption[+].extension.url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* item[=].answerOption[=].extension.valueDecimal = 4
* item[=].answerOption[=].valueCoding = #65- "Above 64 years old"
* item[+].linkId = "bmi"
* item[=].text = "Patient BMI"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[0].extension.url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* item[=].answerOption[=].extension.valueDecimal = 0
* item[=].answerOption[=].valueCoding = #0-25 "0 to 25 km/m2"
* item[=].answerOption[+].extension.url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* item[=].answerOption[=].extension.valueDecimal = 1
* item[=].answerOption[=].valueCoding = #25-30 "25 to 30 km/m2"
* item[=].answerOption[+].extension.url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* item[=].answerOption[=].extension.valueDecimal = 3
* item[=].answerOption[=].valueCoding = #30- "Above 30 km/m2"
* item[+].linkId = "waistcircumference"
* item[=].text = "Waist circumference"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[0].extension.url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* item[=].answerOption[=].extension.valueDecimal = 0
* item[=].answerOption[=].valueCoding = #0-93 "Below 93 cm"
* item[=].answerOption[+].extension.url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* item[=].answerOption[=].extension.valueDecimal = 3
* item[=].answerOption[=].valueCoding = #94-101 "Between 94 and 101"
* item[=].answerOption[+].extension.url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* item[=].answerOption[=].extension.valueDecimal = 4
* item[=].answerOption[=].valueCoding = #102- "Above 102"
* item[+].linkId = "physicalActivity"
* item[=].text = "Physical Activity?"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[0].extension.url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* item[=].answerOption[=].extension.valueDecimal = 0
* item[=].answerOption[=].valueCoding = #yes "Yes"
* item[=].answerOption[+].extension.url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* item[=].answerOption[=].extension.valueDecimal = 2
* item[=].answerOption[=].valueCoding = #no "No"
* item[+].linkId = "fruitsvegs"
* item[=].text = "Daily consumption of fruits and vegetables?"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[0].extension.url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* item[=].answerOption[=].extension.valueDecimal = 0
* item[=].answerOption[=].valueCoding = #yes "more than 5 times a day"
* item[=].answerOption[+].extension.url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* item[=].answerOption[=].extension.valueDecimal = 1
* item[=].answerOption[=].valueCoding = #45-54 "less than 5 times a day"
* item[+].linkId = "BPmeds"
* item[=].text = "History of high Blood pressure meds?"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[0].extension.url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* item[=].answerOption[=].extension.valueDecimal = 0
* item[=].answerOption[=].valueCoding = #no "No"
* item[=].answerOption[+].extension.url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* item[=].answerOption[=].extension.valueDecimal = 2
* item[=].answerOption[=].valueCoding = #yes "Yes"
* item[+].linkId = "histHyperglicemia"
* item[=].text = "History of high blood glucose?"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[0].extension.url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* item[=].answerOption[=].extension.valueDecimal = 0
* item[=].answerOption[=].valueCoding = #no "No"
* item[=].answerOption[+].extension.url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* item[=].answerOption[=].extension.valueDecimal = 5
* item[=].answerOption[=].valueCoding = #yes "Yes"
* item[+].linkId = "familyHistDiabetes"
* item[=].text = "Family history of diabetes?"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[0].extension.url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* item[=].answerOption[=].extension.valueDecimal = 0
* item[=].answerOption[=].valueCoding = #no "No family history"
* item[=].answerOption[+].extension.url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* item[=].answerOption[=].extension.valueDecimal = 3
* item[=].answerOption[=].valueCoding = #second-degree "2nd degree family history"
* item[=].answerOption[+].extension.url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* item[=].answerOption[=].extension.valueDecimal = 5
* item[=].answerOption[=].valueCoding = #first-degree "1st degree family history"
* item[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
* item[=].extension.valueExpression.description = "Total score calculation"
* item[=].extension.valueExpression.language = #text/fhirpath
* item[=].extension.valueExpression.expression = "iif(%allQuestionsAnswered, iif(%finalScore.exists(), %finalScore, 0), {})"
* item[=].linkId = "findriscScore"
* item[=].text = "Patient FINDRISC total score"
* item[=].type = #decimal
* item[=].required = false
* item[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
* item[=].extension.valueExpression.language = #text/fhirpath
* item[=].extension.valueExpression.expression = "%finalScore.exists() and (%finalScore <7)"
* item[=].linkId = "resultriskLow"
* item[=].text = "10-year diabetes risk: Low"
* item[=].type = #text
* item[=].required = false
* item[=].readOnly = true
* item[=].initial.valueString = "The probability of developing type 2 diabetes in 10 years is estimated to be 1 in 100"
* item[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
* item[=].extension.valueExpression.language = #text/fhirpath
* item[=].extension.valueExpression.expression = "%finalScore.exists() and (%finalScore > 6) and (%finalScore <12)"
* item[=].linkId = "resultriskElevated"
* item[=].text = "10-year diabetes risk: Slightly Elevated"
* item[=].type = #text
* item[=].required = false
* item[=].readOnly = true
* item[=].initial.valueString = "The probability of developing type 2 diabetes in 10 years is estimated to be 1 in 25"
* item[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
* item[=].extension.valueExpression.language = #text/fhirpath
* item[=].extension.valueExpression.expression = "%finalScore.exists() and (%finalScore > 11) and (%finalScore <15)"
* item[=].linkId = "resultriskModerate"
* item[=].text = "10-year diabetes risk: Moderate"
* item[=].type = #text
* item[=].required = false
* item[=].readOnly = true
* item[=].initial.valueString = "The probability of developing type 2 diabetes in 10 years is estimated to be 1 in 6"
* item[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
* item[=].extension.valueExpression.language = #text/fhirpath
* item[=].extension.valueExpression.expression = "%finalScore.exists() and (%finalScore > 14) and (%finalScore <21)"
* item[=].linkId = "resultriskHight"
* item[=].text = "10-year diabetes risk: High"
* item[=].type = #text
* item[=].required = false
* item[=].readOnly = true
* item[=].initial.valueString = "The probability of developing type 2 diabetes in 10 years is estimated to be 1 in 3"
* item[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
* item[=].extension.valueExpression.language = #text/fhirpath
* item[=].extension.valueExpression.expression = "%finalScore.exists() and (%finalScore > 20)"
* item[=].linkId = "resultriskVeryHigh"
* item[=].text = "10-year diabetes risk: Very High"
* item[=].type = #text
* item[=].required = false
* item[=].readOnly = true
* item[=].initial.valueString = "The probability of developing type 2 diabetes in 10 years is estimated to be 1 in 2"
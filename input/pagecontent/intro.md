This IG is intended to help introduce [FHIR mapping language](http://www.hl7.org/fhir/mapping-language.html).
Even though a [tutorial](http://www.hl7.org/fhir/mapping-tutorial.html) is available, some more concrete examples are usefull to fully understand this language.
The idea is to look at a certain questionnaire and understand how to understand the mapping mechanisms to create the resources from that.
In short, transform this:

```
{
resourceType: "QuestionnaireResponse",
meta: {
profile: [
            "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaireresponse|2.7"
        ],
tag: [
            {
code: "lformsVersion: 29.3.1"
            }
        ]
    },
status: "completed",
authored: "2022-01-06T10:58:49.676Z",
item: [
        {
linkId: "age",
text: "Patient Age",
answer: [
                {
valueCoding: {
code: "0-44",
display: "0 to 44 years old"
                    }
                }
            ]
        },
        {
linkId: "bmi",
text: "Patient BMI",
answer: [
                {
valueCoding: {
code: "0-25",
display: "0 to 25 km/m2"
                    }
                }
            ]
        },
        {
linkId: "waistcircumference",
text: "Waist circumference",
answer: [
                {
valueCoding: {
code: "0-93",
display: "Below 93 cm"
                    }
                }
            ]
        },
        {
linkId: "physicalActivity",
text: "Physical Activity?",
answer: [
                {
valueCoding: {
code: "yes",
display: "Yes"
                    }
                }
            ]
        },
        {
linkId: "fruitsvegs",
text: "Daily consumption of fruits and vegetables?",
answer: [
                {
valueCoding: {
code: "yes",
display: "more than 5 times a day"
                    }
                }
            ]
        },
        {
linkId: "BPmeds",
text: "History of high Blood pressure meds?",
answer: [
                {
valueCoding: {
code: "no",
display: "No"
                    }
                }
            ]
        },
        {
linkId: "histHyperglicemia",
text: "History of high blood glucose?",
answer: [
                {
valueCoding: {
code: "no",
display: "No"
                    }
                }
            ]
        },
        {
linkId: "familyHistDiabetes",
text: "Family history of diabetes?",
answer: [
                {
valueCoding: {
code: "no",
display: "No family history"
                    }
                }
            ]
        },
        {
linkId: "findriscScore",
text: "Patient FINDRISC total score",
answer: [
                {
valueDecimal: 0
                }
            ]
        },
        {
linkId: "resultriskLow",
text: "10-year diabetes risk: Low",
answer: [
                {
valueString: "The probability of developing type 2 diabetes in 10 years is estimated to be 1 in 100"
                }
            ]
        },
        {
linkId: "resultriskElevated",
text: "10-year diabetes risk: Slightly Elevated",
answer: [
                {
valueString: "The probability of developing type 2 diabetes in 10 years is estimated to be 1 in 25"
                }
            ]
        },
        {
linkId: "resultriskModerate",
text: "10-year diabetes risk: Moderate",
answer: [
                {
valueString: "The probability of developing type 2 diabetes in 10 years is estimated to be 1 in 6"
                }
            ]
        },
        {
linkId: "resultriskHight",
text: "10-year diabetes risk: High",
answer: [
                {
valueString: "The probability of developing type 2 diabetes in 10 years is estimated to be 1 in 3"
                }
            ]
        },
        {
linkId: "resultriskVeryHigh",
text: "10-year diabetes risk: Very High",
answer: [
                {
valueString: "The probability of developing type 2 diabetes in 10 years is estimated to be 1 in 2"
                }
            ]
        }
    ],
questionnaire: http: //hl7belgium.org/mapping/Questionnaire/findrisc-questionnaire
}

```

into this

```
{
    resourceType: "Observation",
        status: "final",
            code: {
        coding: [
            {
                system: http://snomed.info/sct,
                code: "763117005",
                display: "FINDRISC (Finnish Diabetes Risk Score) score"
            }
        ]
    },
    subject: {
        identifier: {
            value: "0"
        }
    },
    valueDecimal: 0
}
```

This IG is intended to help introduce [FHIR mapping language](http://www.hl7.org/fhir/mapping-language.html).
Even though a [tutorial](http://www.hl7.org/fhir/mapping-tutorial.html) is available, some more concrete examples are usefull to fully understand this language.
The idea is to look at a certain questionnaire and understand how to understand the mapping mechanisms to create the resources from that.

Ideally, the following code will be understood after reading this document:
```map "http://hl7belgium.org/mapping/StructureMap/extractfindrisc" = "extractfindrisc"
uses "http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse" alias QuestionnaireResponse as source
uses "http://hl7.org/fhir/StructureDefinition/Observation" alias Observation as target


group QuestionnaireResponse(source src : QuestionnaireResponse, target tgt : Observation) {
      src.item as item where linkId.value in ('findriscScore') -> tgt as scoreresult then item(item, scoreresult) "abc";
      
     src.item as item where linkId.value in ('findriscScore') -> tgt as scoreresult then patient(item, scoreresult) "abc";

group item(source src, target tgt : Observation) {
     src -> tgt.code as code then itemcoding(src, code) "x1";
       src -> tgt.status = 'final' "x2";
        src -> tgt.value = (src.answer.valueDecimal) "x3";}
        
group patient(source src, target tgt : Observation) {
     src -> tgt.subject as patref then patientid(src, patref) "x1a";
     }

group patientid(source src, target tgt : Reference) {
      src -> tgt.identifier as patid then idvalue(src, patid) "xtx";
}

group idvalue(source src, target tgt : Identifier) {
      src -> tgt.value = (src.answer.valueDecimal) "qwe";
      }
      
group itemcoding(source src, target tgt : CodeableConcept) {
  src -> tgt.coding as y then codingcode(src, y) "xx";
}

group codingcode(source src, target tgt : Coding) {
  src -> tgt.code = '763117005' "xy1";
  src -> tgt.system = 'http://snomed.info/sct' "xy2";
  src -> tgt.display = 'FINDRISC (Finnish Diabetes Risk Score) score' "xy3";
}
```

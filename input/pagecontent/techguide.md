To implement such a mapping language, please refer to the [be-matchbox](https://github.com/hl7-be/matchbox) project or the [original](https://github.com/ahdis/matchbox) to start using mapping language in practice.

After having a matchbox (or similar) instance running, first it is needed to create the mapping in the server, by adding a Structure Definition with:

```
curl --location --request POST 'http://localhost:8080/matchbox/fhir/StructureMap' \
--header 'Content-Type: text/fhir-mapping' \
--header 'Accept: application/fhir+xml;fhirVersion=4.0' \
--data-raw 'map "http://hl7belgium.org/mapping/StructureMap/extractfindrisc" = "extractfindrisc"
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
}'
```

After this, you are ready to send QuestionnaireResponse and receive the associated Observation.

So with:

```
curl --location --request POST 'http://localhost:8080/matchbox/fhir/StructureMap/$transform?source=http://ahdis.ch/matchbox/fml/qr2patgender' \
--header 'Content-Type: application/fhir+json;fhirVersion=4.0' \
--header 'Accept: application/fhir+json;fhirVersion=4.0' \
--data-raw '<QuestionnaireResponse>'
```

An according Observation will be created.
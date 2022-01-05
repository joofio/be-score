The mapping to be done is explained in the following image:

{% include test.png %}

Which is acomplished with the following code:
```
map "http://hl7belgium.org/mapping/StructureMap/extractfindrisc" = "extractfindrisc"
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

Now we are going one by one.

```map``` is intended to be used for establishing the name of the mapping. In this case is "extractfindrisc"

The ```uses``` keyword is used for Structure Definition. In short, listing the structures that are going to be used for building the map.
In this case, QuestionnaireResponse is the source and Observation as target.

Groups can be understood as functions where a input and output are connected. The group must be named.
The first ***QuestionnaireResponse*** takes the whole resource QuestionnaireResponse and Observation as target.
It takes the **item** from the questionnaireResponse where the linkId is in 'findriscScore' and names it as *item*. So we have **item** the element and *item* the variable name. The target, which is a Observation is named *scoreresult* and these two variables are passed to ***item*** function (group) and the ***patient*** group.

Inside the ***item*** group takes a src and a target as well. The src is not binded to a resource or format but the target is: Observation.
From the src, which is the item selected in the first group, we will create three elements:
1. code
2. status 
3. value
   
For code, another function is required (***itemcoding***). For status, it will be defined always as "final" and value is directly imputed by the item.answer.valueDecimal (the parenthesis surrounding it are important) of the item passed to the group (the one with linkid in "findriscscore").

For ***itemcoding***, receives a src and the target will be a CodeableConcept. It creates the coding for the code element of the Observation. Its only purpose is to instantiate the coding element. The rest is handled in the ***codingcode*** group.

The ***codingcode*** group is for creating the elements inside the coding. So it creates Observation.code.coding.code, Observation.code.coding.system and Observation.code.coding.display, similar to ***item*** group.

As for the ***patient*** group, it is for creating the patient reference in the observation resource. Similar to ***itemcoding*** , its usefullness is to create the subject element. Then the rest is handled in the ***patientid*** group.

The ***patientid*** group creates the reference for the subject. The final value creation is made in the ***idvalue*** group, where the reference is created.


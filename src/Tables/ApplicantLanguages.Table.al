Table 52194017 ApplicantLanguages
{

    fields
    {
        field(1; LanguageCode; Code[20])
        {
            ////TableRelation = Table52005.Field1;
        }
        field(2; ApplicantNo; Code[20])
        {
            NotBlank = false;

            trigger OnValidate()
            begin
                /*
                IF ApplicantNo <> xRec.ApplicantNo THEN BEGIN
                  HumanResSetup.GET;
                  NoSeriesMgt.TestManual(HumanResSetup."Applicants Nos.");
                  "No. Series" := '';
                END;
                */

            end;
        }
        field(3; LanguageRead; Boolean)
        {
        }
        field(4; LanguageWrite; Boolean)
        {
        }
        field(5; LanguageSpeak; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; LanguageCode, ApplicantNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; LanguageCode)
        {
        }
    }
}


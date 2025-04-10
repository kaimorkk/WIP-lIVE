Table 52193884 "Job Requirementx1"
{
    DrillDownPageID = "Job Requirements";
    LookupPageID = "Job Requirements";

    fields
    {
        field(1;"Job Id";Code[20])
        {
            NotBlank = true;
            TableRelation = "Company Jobs1"."Job ID";
        }
        field(2;"Qualification Type";Option)
        {
            NotBlank = false;
            OptionMembers = " ",Academic,Professional,Technical,Experience,"Personal Attributes";
        }
        field(3;"Qualification Code";Code[10])
        {
            Editable = true;
            NotBlank = true;
            TableRelation = Qualification.Code where ("Qualification Type"=field("Qualification Type"));

            trigger OnValidate()
            begin
                QualificationSetUp.Reset;
                QualificationSetUp.SetRange(QualificationSetUp.Code,"Qualification Code");
                if QualificationSetUp.Find('-') then
                Qualification:=QualificationSetUp.Description;
            end;
        }
        field(4;Qualification;Text[200])
        {
            NotBlank = false;
        }
        field(5;"Job Requirements";Text[250])
        {
            NotBlank = true;
        }
        field(6;Priority;Option)
        {
            OptionMembers = " ",High,Medium,Low;
        }
        field(7;"Job Specification";Option)
        {
            OptionMembers = " ",Academic,Professional,Technical,Experience;
        }
        field(8;"Score ID";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Job Id","Qualification Type","Qualification Code")
        {
            Clustered = true;
            SumIndexFields = "Score ID";
        }
    }

    fieldgroups
    {
    }

    var
        QualificationSetUp: Record Qualification;
}


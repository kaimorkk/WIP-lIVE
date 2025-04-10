Table 52193900 "Succession Gaps1"
{
    DrillDownPageID = "Training Facilitators";
    LookupPageID = "Training Facilitators";

    fields
    {
        field(1;"Employee No";Code[20])
        {
            NotBlank = true;
        }
        field(2;"Job Id";Code[20])
        {
            NotBlank = true;
            TableRelation = "Company Jobs1"."Job ID";
        }
        field(3;"Qualification Type";Option)
        {
            NotBlank = false;
            OptionMembers = " ",Academic,Professional,Technical,Experience,"Personal Attributes";
        }
        field(4;"Qualification Code";Code[10])
        {
            Editable = true;
            NotBlank = true;
            TableRelation = Qualification.Code where (Type=field("Qualification Type"));

            trigger OnValidate()
            begin
                QualificationSetUp.Reset;
                QualificationSetUp.SetRange(QualificationSetUp.Code,Qualification);
                if QualificationSetUp.Find('-') then
                "Qualification Code":=QualificationSetUp.Description;
            end;
        }
        field(5;Qualification;Text[200])
        {
            NotBlank = false;
        }
        field(6;"Job Requirements";Text[250])
        {
            NotBlank = true;
        }
        field(7;Priority;Option)
        {
            OptionMembers = " ",High,Medium,Low;
        }
        field(8;"Job Specification";Option)
        {
            OptionMembers = " ",Academic,Professional,Technical,Experience;
        }
        field(9;"Score ID";Decimal)
        {
            TableRelation = Qualification."Qualified Employees";
        }
    }

    keys
    {
        key(Key1;"Employee No","Job Id","Qualification Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        QualificationSetUp: Record Qualification;
}


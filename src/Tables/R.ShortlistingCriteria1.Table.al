Table 52193772 "R. Shortlisting Criteria1"
{

    fields
    {
        field(1;"Need Code";Code[20])
        {
            TableRelation = "Recruitment Needs1"."No.";
        }
        field(2;"Stage Code";Code[50])
        {
            TableRelation = "Recruitment Stages1"."Recruitement Stage";
        }
        field(3;"Job ID";Code[20])
        {
            TableRelation = "Company Jobs1"."Job ID";
        }
        field(4;"Qualification Type";Option)
        {
            OptionCaption = ' ,Academic,Professional,Technical,Experience,Personal Attributes';
            OptionMembers = " ",Academic,Professional,Technical,Experience,"Personal Attributes";
        }
        field(5;Qualification;Code[20])
        {
            TableRelation = Qualification.Code where ("Qualification Type"=field("Qualification Type"));

            trigger OnValidate()
            begin
                 QualificationsRec.Reset;
                 if QualificationsRec.Get(Qualification) then
                  "Qualification Description":=QualificationsRec.Description;
            end;
        }
        field(6;"Desired Score";Decimal)
        {
            TableRelation = "Score Setup1"."Score ID";
        }
        field(7;"Qualification Description";Text[250])
        {
        }
    }

    keys
    {
        key(Key1;"Need Code","Stage Code","Job ID","Qualification Type",Qualification)
        {
            Clustered = true;
            SumIndexFields = "Desired Score";
        }
    }

    fieldgroups
    {
    }

    var
        QualificationsRec: Record Qualification;
}


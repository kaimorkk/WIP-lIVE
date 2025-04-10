Table 52193773 Advertising1
{

    fields
    {
        field(1;"Need Code";Code[20])
        {
            NotBlank = true;
            TableRelation = "Recruitment Needs1"."No.";

            trigger OnValidate()
            begin
                    RecruitmentNeeds.Reset;
                   RecruitmentNeeds.SetRange(RecruitmentNeeds."No.","Need Code");
                   if RecruitmentNeeds.Find('-') then
                        "Expected Reporting Date":=RecruitmentNeeds."Expected Reporting Date";
            end;
        }
        field(2;"Advertising Media";Code[20])
        {
            NotBlank = true;
            TableRelation = Vendor."No.";
        }
        field(3;Date;Date)
        {
        }
        field(4;Amount;Decimal)
        {
        }
        field(5;"Advertisement Doc Link";Text[200])
        {
        }
        field(6;Posted;Boolean)
        {
            Editable = false;
        }
        field(7;"Expected Reporting Date";Date)
        {
        }
        field(8;"Closing Date";Date)
        {
        }
        field(9;"Opening Date";Date)
        {
        }
    }

    keys
    {
        key(Key1;"Need Code","Advertising Media",Date)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RecruitmentNeeds: Record "Recruitment Needs1";
}


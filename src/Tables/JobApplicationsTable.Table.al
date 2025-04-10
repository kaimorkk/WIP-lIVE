Table 52194016 "Job Applications Table"
{

    fields
    {
        field(1;ApplicationNo;Code[20])
        {
            Editable = false;
        }
        field(2;JobAppliedFor;Code[20])
        {
            Editable = false;
        }
        field(3;"Recruitment Need Code";Code[20])
        {
            TableRelation = "Recruitment Needs1"."No.";

            trigger OnValidate()
            begin
                Needs.Reset;
                Needs.SetRange(Needs."No.","Recruitment Need Code");
                if Needs.Find('-') then begin
                JobAppliedFor:=Needs."Job ID";
                JobDescription:=Needs.Description;
                end;
            end;
        }
        field(4;TotalScore;Decimal)
        {
            FieldClass = Normal;
        }
        field(5;Shortlist;Boolean)
        {
        }
        field(6;Stage;Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(7;"Application Date";Date)
        {
        }
        field(8;JobDescription;Text[200])
        {
        }
        field(9;NoSeries;Code[20])
        {
            TableRelation = "No. Series";
        }
        field(10;ApplicantID;Code[20])
        {
            FieldClass = Normal;
            TableRelation = Applicants1;
        }
    }

    keys
    {
        key(Key1;ApplicationNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Needs: Record "Recruitment Needs1";
}


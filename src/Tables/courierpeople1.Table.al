Table 52193708 "courier people1"
{
    DrillDownPageID = "Mails list";
    LookupPageID = "Mails list";

    fields
    {
        field(1;"code";Code[20])
        {
            NotBlank = false;
        }
        field(2;Description;Text[200])
        {
            NotBlank = true;
        }
        field(4;Time;Time)
        {
            NotBlank = true;
        }
        field(8;"No. Series";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"code",Description)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if code = '' then begin
          SalesSetup.Get;
          SalesSetup.TestField(Mails);
          NoSeriesMgt.InitSeries(SalesSetup.Mails,xRec.code,0D,code,"No. Series");
        end;
    end;

    var
        Employees: Record Employee;
        SalesSetup: Record "Resource Centre Setup1";
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Doc: Record "Document Types1";
}


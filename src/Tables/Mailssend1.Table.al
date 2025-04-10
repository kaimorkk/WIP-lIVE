Table 52193703 "Mails send1"
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
        field(3;"Date received";Date)
        {
            NotBlank = true;
        }
        field(4;Time;Time)
        {
            NotBlank = true;
        }
        field(5;"Addressee code";Code[10])
        {
            NotBlank = true;
            TableRelation = "courier people1".Description;
        }
        field(6;"Addressee Name";Text[100])
        {
        }
        field(7;Category;Code[10])
        {
            NotBlank = true;
            TableRelation = "Document Types1";

            trigger OnValidate()
            begin
                        if Doc.Get(Category) then
                        "Category Name":=Doc."Document Name"
                        else
                        "Category Name":='';
            end;
        }
        field(8;"No. Series";Code[20])
        {
        }
        field(9;"Available in Registry?";Boolean)
        {
        }
        field(10;"Category Name";Text[100])
        {
        }
        field(24;"Courier description";Text[30])
        {
        }
    }

    keys
    {
        key(Key1;"code")
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
          SalesSetup.TestField(SalesSetup."mails send");
          NoSeriesMgt.InitSeries(SalesSetup."mails send",xRec.code,0D,code,"No. Series");
        end;
    end;

    var
        Employees: Record Employee;
        SalesSetup: Record "Resource Centre Setup1";
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Doc: Record "Document Types1";
}


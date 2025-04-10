Table 52193702 Mails1
{

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
        field(5;Receiver;Code[10])
        {
            NotBlank = true;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                 if Employees.Get(Receiver) then


                 "Receiver Name":=Employees."First Name"+' '+Employees."Last Name"
                 else
                  "Receiver Name":='';
            end;
        }
        field(6;"Receiver Name";Text[100])
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
        field(23;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");
            end;
        }
        field(24;"Global Dimension 2 Code";Code[20])
        {
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
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


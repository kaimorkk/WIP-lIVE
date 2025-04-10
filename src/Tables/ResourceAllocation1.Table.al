Table 52193704 "Resource Allocation1"
{

    fields
    {
        field(1;"Code";Code[20])
        {
        }
        field(2;"Office Code";Code[20])
        {
            TableRelation = "Office Spaces1";
        }
        field(3;"Office Allocation Code";Code[20])
        {
            TableRelation = "Office and Keys allocations1";
        }
        field(4;"Item Description";Text[50])
        {
        }
        field(5;Quantity;Integer)
        {
        }
        field(6;From;Date)
        {
        }
        field(7;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(8;"To";Date)
        {
        }
        field(9;"Asset No";Code[20])
        {
            TableRelation = "Fixed Asset";

            trigger OnValidate()
            begin
                 if FA.Get("Asset No")  then
                 "Item Description":=FA.Description;
                 "Asset Category":=FA."FA Subclass Code";
                 //Model:=FA.Model;
                 "Serial No":=FA."Serial No.";
                   Modify;
            end;
        }
        field(10;"Asset Category";Code[20])
        {
        }
        field(11;Model;Text[100])
        {
        }
        field(12;"Serial No";Code[50])
        {
        }
    }

    keys
    {
        key(Key1;"Code","Office Code","Office Allocation Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
          SalesSetup.Get;
          SalesSetup.TestField(Resource);
          NoSeriesMgt.InitSeries(SalesSetup.Resource,xRec.Code,0D,Code,"No. Series");
        end;
    end;

    var
        SalesSetup: Record "Resource Centre Setup1";
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        FA: Record "Fixed Asset";
}


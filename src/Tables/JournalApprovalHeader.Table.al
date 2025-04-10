Table 52194082 "Journal Approval Header"
{

    fields
    {
        field(1;"No.";Code[20])
        {
        }
        field(2;"Journal Batch Name";Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name where ("Journal Template Name"=field("Journal Template Name"),
                                                             "No. Series"=filter(''));
        }
        field(3;"Journal Template Name";Code[10])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(4;"No. Series";Code[20])
        {
        }
        field(5;Status;Option)
        {
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Canceled,Rejected,Approved';
            OptionMembers = Open,"Pending Approval",Canceled,Rejected,Approved;
        }
        field(6;Balance;Decimal)
        {
            CalcFormula = sum("Gen. Journal Line Approval"."Balance (LCY)" where ("Journal Template Name"=field("Journal Template Name"),
                                                                                  "Journal Batch Name"=field("Journal Batch Name"),
                                                                                  "No."=field("No.")));
            FieldClass = FlowField;
        }
        field(7;Posted;Boolean)
        {
            Editable = false;
        }
        field(8;"Shortcut Dimension 1 Code";Code[10])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(9;"Shortcut Dimension 2 Code";Code[10])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
    }

    keys
    {
        key(Key1;"No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "No."='' then begin

          GLSetup.Get;
          GLSetup.TestField(GLSetup."Journal Numbers");
          NoSeriesMgt.InitSeries(GLSetup."Journal Numbers",xRec."No.",0D,"No.","No. Series");
        end;
    end;

    var
        GLSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}


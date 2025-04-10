XmlPort 50011 Payments
{

    schema
    {
        textelement(Payments)
        {
            tableelement("PV Lines1"; "PV Lines1")
            {
                XmlName = 'Pvlines';
                fieldelement(Accounttype; "PV Lines1"."Account Type")
                {
                }
                fieldelement(Accountno; "PV Lines1"."Account No")
                {
                }
                fieldelement(Description; "PV Lines1".Description)
                {
                }
                fieldelement(Amount; "PV Lines1".Amount)
                {
                }
                fieldelement(Dimension1; "PV Lines1"."Shortcut Dimension 1 Code")
                {
                }
                fieldelement(Dimension2; "PV Lines1"."Shortcut Dimension 2 Code")
                {
                }

                trigger OnBeforeInsertRecord()
                begin
                    "PV Lines1"."PV No" := PVNo;
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    var
        PVNo: Code[20];


    procedure GetRec(PV: Record Payments)
    begin
        PVNo := PV.No;
    end;
}


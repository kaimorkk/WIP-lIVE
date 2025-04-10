XmlPort 50004 "Import Invoices"
{
    Format = VariableText;

    schema
    {
        textelement(SalesLine)
        {
            tableelement("Sales Line"; "Sales Line")
            {
                XmlName = 'Invoice';
                fieldelement(Type; "Sales Line".Type)
                {
                }
                fieldelement(No; "Sales Line"."No.")
                {
                }
                fieldelement(Description; "Sales Line".Description)
                {
                }
                fieldelement(Quantity; "Sales Line".Quantity)
                {
                }
                fieldelement(UnitPrice; "Sales Line"."Unit Price")
                {
                }

                trigger OnAfterInitRecord()
                begin
                    LineNo := 10000;
                    "Sales Line".Reset;
                    "Sales Line".SetRange("Document Type", DocumentType);
                    "Sales Line".SetRange("Document No.", DocumentNo);
                    if "Sales Line".Find('+') then
                        LineNo := "Sales Line"."Line No." + 10000;
                    "Sales Line"."Document Type" := DocumentType;
                    "Sales Line"."Document No." := DocumentNo;
                    "Sales Line"."Sell-to Customer No." := CustomerNo;
                    "Sales Line"."Line No." := LineNo;
                    //  MESSAGE(DocumentNo);
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
        DocumentNo: Code[10];
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";
        CustomerNo: Code[20];
        LineNo: Integer;
        SalesHeader: Record "Sales Header";


    procedure GetRec(Header: Record "Sales Header")
    begin
        DocumentNo := Header."No.";
        DocumentType := Header."Document Type";
        CustomerNo := Header."Sell-to Customer No.";
    end;
}


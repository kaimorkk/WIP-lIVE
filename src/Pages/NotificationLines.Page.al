Page 52193673 "Notification Lines"
{
    AutoSplitKey = true;
    Caption = 'Notification Lines';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Notification Lines";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(Text; Text)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
        }
    }

    trigger OnDeleteRecord(): Boolean
    var
        ReservePurchLine: Codeunit "Purch. Line-Reserve";
    begin
    end;

    var
        Text000: label 'Unable to execute this function while in view only mode.';
        Contribution: XmlPort "Monthly Contributions";
        RecType: Record "Receipts and Payments Types";

        ProductCodeEnabled: Boolean;
        LoanNoEnabled: Boolean;
        RecLines: Record "Receipts Lines";
        AmountEditable: Boolean;
}


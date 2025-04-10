

page 69277 "Hr Asset Transfer List"
{
    CardPageID = "Hr Asset Transfer Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "HR Asset Transfer Header";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Transfered; Rec.Transfered)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfered field.';
                }
                field("Date Transfered"; Rec."Date Transfered")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Transfered field.';
                }
                field("Transfered By"; Rec."Transfered By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfered By field.';
                }
                field("Time Posted"; Rec."Time Posted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Posted field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore


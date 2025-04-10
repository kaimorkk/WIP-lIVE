

page 69507 "Safe Work Permits COM"
{
    CardPageID = "Safe Work Permit Completion";
    Editable = false;
    PageType = List;
    SourceTable = "Safe Work Permit Header";
    SourceTableView = where("Document Type" = const("Safe Work Completion Report"));


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Safety Work Permit ID"; Rec."Safety Work Permit ID")
                {
                    ApplicationArea = Basic;
                }
                field("HSE Plan Type"; Rec."HSE Plan Type")
                {
                    ApplicationArea = Basic;
                }
                field("OSH Management Plan ID"; Rec."OSH Management Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Management Plan ID"; Rec."Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore


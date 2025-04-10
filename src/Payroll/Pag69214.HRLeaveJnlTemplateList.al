

page 52193694 "HR Leave Jnl. Template List"
{
    Caption = 'Leave Jnl. Template List';
    Editable = true;
    PageType = List;
    SourceTable = "HR Leave Journal Template";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Source Code"; Rec."Source Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source Code field.';
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Reason Code field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Template)
            {
                Caption = 'Template';
                action("&Batches")
                {
                    ApplicationArea = Basic;
                    Caption = '&Batches';
                    Image = ChangeBatch;
                    RunObject = Page "HR Leave Batches";
                    RunPageLink = "Journal Template Name" = field(Name);
                    ToolTip = 'Executes the &Batches action.';
                }
            }
        }
        area(Promoted)
        {
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Template', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref("&Batches_Promoted"; "&Batches")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore


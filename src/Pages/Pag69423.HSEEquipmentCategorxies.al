

page 69423 "HSE Equipment Categorxies"
{
    CardPageID = "HSE Equipment Categoryx";
    PageType = List;
    SourceTable = "HSE Equipment Categoryx";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Additional Notes/Comments"; Rec."Additional Notes/Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Notes/Comments field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Safety Equipment Register")
            {
                ApplicationArea = Basic;
                Caption = 'Safety Equipment Register';
                Image = DistributionGroup;
                RunObject = Page "Safety Equipment Registers";
                RunPageLink = "Safety Equipment Category" = field(Code);
                ToolTip = 'Executes the Safety Equipment Register action.';
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Safety Equipment Register_Promoted"; "Safety Equipment Register")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore


page 50187 Ward
{
    ApplicationArea = All;
    Caption = 'Ward';
    PageType = List;
    SourceTable = Ward;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(County; Rec.County)
                {
                    ToolTip = 'Specifies the value of the County field.', Comment = '%';
                }
                field("Sub County"; Rec."Sub County")
                {
                    ToolTip = 'Specifies the value of the Sub County field.', Comment = '%';
                }
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Ward field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(New)
            {
                ApplicationArea = Basic;
                Caption = 'Village';
                Image = New;
                RunObject = Page Village;
                RunPageLink = County = field(County), "Sub County" = field("Sub County"), Ward = field("Code");
            }

        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(New_Promoted; New)
                {
                }
            }
        }
    }
}

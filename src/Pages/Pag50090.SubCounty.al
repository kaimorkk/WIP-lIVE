page 50090 "Sub County"
{
    ApplicationArea = All;
    Caption = 'Sub County';
    PageType = List;
    SourceTable = "Sub County";
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
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Sub County field.', Comment = '%';
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
                Caption = 'Ward';
                Image = New;
                RunObject = Page Ward;
                RunPageLink = County = field(County), "Sub County" = field("Code");
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

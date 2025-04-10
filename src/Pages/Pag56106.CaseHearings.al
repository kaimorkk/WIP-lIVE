

page 56106 "Case Hearings"
{
    PageType = List;
    SourceTable = "Case Hearing";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Day; Rec.Day)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Day field.';
                }
                field("Hearing Date"; Rec."Last Hearing Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Hearing Date field.';
                }
                field(Progress; Rec.Progress)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Progress field.';
                }
                field("Next Hearing Date"; Rec."Next Hearing Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next Hearing Date field.';
                }
                field("Advocate On Record"; Rec."Advocate On Record")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Advocate On Record field.';
                }
                field(Decision; Rec.Decision)
                {
                    ApplicationArea = Basic;
                    //MultiLine = true;
                    ToolTip = 'Specifies the value of the Decision field.';
                }
                field("Bring Up Date"; Rec."Bring Up Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bring Up Date field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        //IF CurrDate:=FORMAT(CALCDATE('<TODAY-7D>',"Bring Up Date")) then BEGIN
        //MESSAGE('WE Have an UpComing Hearing On %1',"Bring Up Date")
        //END;
    end;

    var
        CurrDate: Date;
}

#pragma implicitwith restore


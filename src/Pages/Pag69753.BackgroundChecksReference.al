

page 69753 "Background Checks Reference"
{
    PageType = ListPart;
    SourceTable = "Background Checks Reference";
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Referee Id"; Rec."Referee Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Referee Id field.';
                }
                field("Referee Type"; Rec."Referee Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Referee Type field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Lead HR Officer"; Rec."Lead HR Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead HR Officer field.';
                }
                field("Invited for Detailed Recommend"; Rec."Invited for Detailed Recommend")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invited for Detailed Recommend field.';
                }
                field("Invited On"; Rec."Invited On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invited On field.';
                }
                field("Referee Recomm Report ID"; Rec."Referee Recomm Report ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Referee Recomm Report ID field.';
                }
                field("Recommended for Hire"; Rec."Recommended for Hire")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommended for Hire field.';
                }
                field("Title/Designation"; Rec."Title/Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title/Designation field.';
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Invite for Recomendation")
            {
                ApplicationArea = Basic;
                Image = Post;
                ToolTip = 'Executes the Invite for Recomendation action.';
                trigger OnAction()
                var
                    TXT001: label 'Invite the referee %1 to give recommendation?';
                begin
                    if Confirm(TXT001, true, Rec.Name) = true then begin
                        Recruitment.NotifyReferee(Rec);
                    end
                end;
            }
        }
    }

    var
        Recruitment: Codeunit Recruitment;
}

#pragma implicitwith restore


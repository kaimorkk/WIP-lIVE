

page 69756 "Referee Recommendation Card"
{
    PageType = Card;
    SourceTable = "Referee Recommendation";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Background Checks Invitation"; Rec."Background Checks Invitation")
                {
                    ApplicationArea = Basic;
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Referee Id"; Rec."Referee Id")
                {
                    ApplicationArea = Basic;
                }
                field("Known From"; Rec."Known From")
                {
                    ApplicationArea = Basic;
                }
                field("Known To"; Rec."Known To")
                {
                    ApplicationArea = Basic;
                }
                field("Candidate Last Job Title"; Rec."Candidate Last Job Title")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Exit Reason Code"; Rec."Staff Exit Reason Code")
                {
                    ApplicationArea = Basic;
                }
                field("Recommend For Hire"; Rec."Recommend For Hire")
                {
                    ApplicationArea = Basic;
                }
                field("Lead HR Officer"; Rec."Lead HR Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Title/Designation"; Rec."Title/Designation")
                {
                    ApplicationArea = Basic;
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control30; "Referee Recommendation Lines")
            {
                SubPageLink = "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control26; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control27; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control28; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control29; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Requirements Rating")
            {
                ApplicationArea = Basic;
                Image = Ranges;
                RunObject = Page "Referee Recommendation Rating";
                RunPageLink = "Document No." = field("Document No."),
                              "Vacancy ID" = field("Vacancy ID");
            }
            action("Suggest Requirements")
            {
                ApplicationArea = Basic;
                Image = Suggest;

                trigger OnAction()
                var
                    TXT001: label 'Suggest requirements for the position';
                begin
                    if Confirm(TXT001) = true then begin
                        Recruitment.SuggestRefRequirements(Rec);
                    end
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                ToolTip = 'Post recommendation to the background checks header';

                trigger OnAction()
                begin
                    ChecksReference.Reset;
                    ChecksReference.SetRange("Referee Recomm Report ID", Rec."Document No.");
                    ChecksReference.SetRange("Referee Id", Rec."Referee Id");
                    if ChecksReference.FindFirst then begin
                        ChecksReference."Recommended for Hire" := Rec."Recommend For Hire";
                        ChecksReference.Modify(true);
                    end
                end;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref("Suggest Requirements_Promoted"; "Suggest Requirements")
                {
                }
            }
            group(Category_Category4)
            {
                actionref("Requirements Rating_Promoted"; "Requirements Rating")
                {
                }
                actionref(Post_Promoted; Post)
                {
                }
            }
        }
    }

    var
        Recruitment: Codeunit Recruitment;
        ChecksReference: Record "Background Checks Reference";
}

#pragma implicitwith restore


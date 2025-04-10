

page 80357 "Customer Survey Response"
{
    PageType = Card;
    SourceTable = "Business Research Response";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Business Research Category"; Rec."Business Research Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Business Research Category field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Survey ID"; Rec."Survey ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Survey ID field.';
                }
                field("Survey Type"; Rec."Survey Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Survey Type field.';
                }
                field("Target Respondent Type"; Rec."Target Respondent Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Respondent Type field.';
                }
                field("Participant ID"; Rec."Participant ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Participant ID field.';
                }
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
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Primary Department ID"; Rec."Primary Department ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Department ID field.';
                }
                field("Primary Directorate ID"; Rec."Primary Directorate ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Directorate ID field.';
                }
            }
            part(Control15; "BR Response Section")
            {
                SubPageLink = "Survey Response ID" = field("Document No.");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Submit)
            {
                ApplicationArea = Basic;
                Caption = 'Submit';
                Image = Save;
                ToolTip = 'Executes the Submit action.';
                trigger OnAction()
                begin
                    BRResponseQuestion.Reset;
                    BRResponseQuestion.SetRange("Survey Response ID", Rec."Survey ID");
                    BRResponseQuestion.SetRange(Mandatory, true);
                    BRResponseQuestion.SetRange("Response Type", BRResponseQuestion."response type"::"Single Response");
                    if BRResponseQuestion.FindFirst then begin
                        repeat
                            if BRResponseQuestion."Rating Type" = BRResponseQuestion."rating type"::"Options Text" then
                                BRResponseQuestion.TestField("Response Value");
                            if BRResponseQuestion."Rating Type" = BRResponseQuestion."rating type"::"Open Text" then
                                BRResponseQuestion.TestField("General Response Statement");
                        until BRResponseQuestion.Next = 0;
                    end;

                    Rec.Status := Rec.Status::Submitted;
                    Rec.Modify;

                    Message('Your Response has been submitted successfully, Thanks for participating');
                end;
            }
            action(Copy)
            {
                ApplicationArea = Basic;
                Caption = 'Copy';
                Image = Copy;
                ToolTip = 'Executes the Copy action.';
                trigger OnAction()
                begin
                    BRResponseQuestion.Reset;
                    BRResponseQuestion.SetRange("Survey Response ID", Rec."Survey ID");
                    BRResponseQuestion.SetRange(Mandatory, true);
                    BRResponseQuestion.SetRange("Response Type", BRResponseQuestion."response type"::"Single Response");
                    if BRResponseQuestion.FindFirst then begin
                        repeat
                            if BRResponseQuestion."Rating Type" = BRResponseQuestion."rating type"::"Options Text" then
                                BRResponseQuestion.TestField("Response Value");
                            if BRResponseQuestion."Rating Type" = BRResponseQuestion."rating type"::"Open Text" then
                                BRResponseQuestion.TestField("General Response Statement");
                        until BRResponseQuestion.Next = 0;
                    end;

                    Rec.Status := Rec.Status::Submitted;
                    Rec.Modify;

                    Message('Your Response has been submitted successfully, Thanks for participating');
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Category5)
            {
                actionref(Submit_Promoted; Submit)
                {
                }
                actionref(Copy_Promoted; Copy)
                {
                }
            }
        }
    }

    var
        BusinessResearchResponse: Record "Business Research Response";
        BRResponseQuestion: Record "BR Response Question";
}

#pragma implicitwith restore


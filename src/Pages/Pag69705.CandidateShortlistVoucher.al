

page 69705 "Candidate Shortlist Voucher"
{
    Caption = 'Candidate Shortlist Voucher';
    PageType = Card;
    SourceTable = "Candidate Selection Header";
    SourceTableView = where("Document Type" = filter("Candidate Shortlisting"));

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
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Appointed Selection Comm ID"; Rec."Appointed Selection Comm ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointed Selection Comm ID field.';
                }
                field("Selection Committee Chair"; Rec."Selection Committee Chair")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Selection Committee Chair field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                group("Shortlisting Fields")
                {
                    field("Shortlisting Type"; Rec."Shortlisting Type")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Shortlisting Type field.';
                    }
                    field("Minimum Academic Qualification"; Rec."Minimum Academic Qualification")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Minimum Academic Qualification field.';
                    }

                    field("Min Academic Hierarchy Pointer"; Rec."Min Academic Hierarchy Pointer")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Min Academic Hierarchy Pointer field.';
                    }
                    field("Minimum Work Experience"; Rec."Minimum Work Experience")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Minimum Work Experience field.';
                    }
                    field("Minimum Mngmnt Experience"; Rec."Minimum Mngmnt Experience")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Minimum Management Experience field.';
                    }
                }
                group(Statistics)
                {
                    field("No. of Submitted Applications"; Rec."No. of Submitted Applications")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the No. of Submitted Applications field.';
                    }

                }
            }
            part(Control3; "Job Appliants Details")
            {
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No" = field("Document No."),
                              "Vacancy ID" = field("Vacancy ID");
                ApplicationArea = Basic;
            }
            group("Vacancy Details")
            {
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position ID field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("No. of openings"; Rec."No. of openings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of openings field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field("Seniority Level"; Rec."Seniority Level")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Seniority Level field.';
                }
                field("Default Terms of Service Code"; Rec."Default Terms of Service Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Terms of Service Code field.';
                }
                field("Employment Type"; Rec."Employment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employment Type field.';
                }
                field("Application Closing Date"; Rec."Application Closing Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Closing Date field.';
                }
                field("Application Closing Time"; Rec."Application Closing Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Closing Time field.';
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Start Date field.';
                }
                field("Planned end Date"; Rec."Planned end Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned end Date field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control37; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control38; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control39; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control40; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Generate Longlist")
            {
                ApplicationArea = Basic;
                Image = SuggestCustomerPayments;
                ToolTip = 'Executes the generate longlist action.';
                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to generate the longlisting';
                begin
                    if Confirm(TXT001) = true then begin
                        Recruitment.FnSuggestapplicants(Rec);
                    end
                end;
            }
            action("Generate Shortlist")
            {
                ApplicationArea = Basic;
                Image = LiFo;
                ToolTip = 'Executes the Generate Shortlist action.';
                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to generate the Shortlist for the vacancy %1?';
                    TXT002: label 'The Shortlist has been succesfully generated';
                begin
                    if Confirm(TXT001, true, Rec."Job Title") = true then begin
                        Recruitment.FnShortlistBasedOnDefinedParameters2(Rec);
                        if CONFIRM('Are you sure you want to generate a Shortlist', true) then begin
                            Recruitment.FnShortlistStep1(Rec);
                            Recruitment.FnShortlistStep2(Rec);
                            Recruitment.FnShortlistStep3(Rec);
                            Recruitment.FnShortlistStep4(Rec);
                            Recruitment.FnShortlistStep5(Rec);
                            Rec."Shortlist Generated" := true;
                            Rec."Shortlist Generated By" := Userid;
                            Rec.Modify(true);
                            MESSAGE('Shortlist Generated Sucessfully, Please check on the lines');
                        end;
                        Message(TXT002);
                    end;
                end;
            }

            action(AutoassignShortlistcomm)
            {
                ApplicationArea = Basic;
                Image = DistributionGroup;
                Caption = 'Auto-Allocate Applications';
                trigger OnAction()
                var
                    TXT001: label 'All the applications have been assigned successfully,Kindly proceed for individual shortlisting';
                    TXT002: label 'Are you sure you want to Auto-assign Shortlisting Committee';
                begin
                    if Confirm(TXT002, true, Rec."Job Title") = true then begin
                        Rec.TestField(Rec."Document Status", Rec."Document Status"::Active);
                        Recruitment.AutoassignShortlistcomm(Rec);
                        Rec."Document Status" := Rec."Document Status"::"Pending Consolidation";
                        Rec.Modify(true);
                        Message(TXT001);
                    end;
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Caption = 'Create Interview Invitation Voucher';
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                var
                    TXT001: label 'The document has been posted succesfully';
                    TXT002: label 'Are you sure you want to post the shortlisting Voucher';
                begin
                    Rec.TestField(Posted, false);
                    Rec.TestField(Rec."Document Status", Rec."Document Status"::"Pending Consolidation");
                    if Confirm(TXT002, true, Rec."Job Title") = true then begin
                        Recruitment.CreateInterviewInvitation(Rec);
                        Message(TXT001);
                    end;
                end;
            }
            //AutoassignShortlistcomm
        }
        area(navigation)
        {
            group(Shortlisting)
            {

                action("Candidate Shortlist Committee")
                {
                    ApplicationArea = Basic;
                    Caption = 'Candidate Shortlist Committee';
                    Image = Components;
                    RunObject = Page "Candidate Shortlist Committee";
                    RunPageLink = "Document No." = field("Document No."),
                                  "Appointed Committee ID" = field("Appointed Selection Comm ID");
                    ToolTip = 'Executes the Candidate Shortlist Committee action.';
                }
            }
            group("Long Listing")
            {
                action("Failed Education")
                {
                    ApplicationArea = Basic;
                    Image = FaultDefault;
                    RunObject = Page "Job Applications";
                    RunPageLink = "Vacancy Id" = field("Vacancy ID"), "Passed Minimum Academic" = const(false), Shortlisted = const(false);
                    ToolTip = 'Executes the Failed Education action.';
                }
                action("Failed Management Experience")
                {
                    ApplicationArea = Basic;
                    Image = MakeAgreement;
                    RunObject = Page "Job Applications";
                    RunPageLink = "Vacancy Id" = field("Vacancy ID"), "Passed Minimum Mngt Exp" = const(false), Shortlisted = const(false);
                    ToolTip = 'Executes the Failed Management Experience action.';
                }
                action("Failed Work Experience")
                {
                    ApplicationArea = Basic;
                    Image = EditForecast;
                    RunObject = Page "Job Applications";
                    RunPageLink = "Vacancy Id" = field("Vacancy ID"), "Passed Minimum Work Exp" = const(false), Shortlisted = const(false);
                    ToolTip = 'Executes the Failed Work Experience action.';
                }
                action("All Applications")
                {
                    ApplicationArea = Basic;
                    Image = Accounts;
                    RunObject = Page "Job Applications";
                    RunPageLink = "Vacancy Id" = field("Vacancy ID");
                    ToolTip = 'Executes the All Applications action.';
                }
            }
        }
        area(reporting)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Generate Shortlist Report';
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(69622, true, false, Rec);
                end;
            }
            //69641
            action(Print2)
            {
                ApplicationArea = Basic;
                Caption = 'Generate Longlist Report';
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                var
                    jobapp: record "Job Applications";
                begin
                    jobapp.Reset();
                    jobapp.SetRange("vacancy id", Rec."Vacancy ID");
                    Report.Run(69641, true, false, jobapp);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Generate Longlist_Promoted"; "Generate Longlist")
                {
                }
                actionref("Generate Shortlist_Promoted"; "Generate Shortlist")
                {
                }
                actionref(AutoassignShortlistcomm_Promoted; AutoassignShortlistcomm)
                {
                }
                actionref(Post_Promoted; Post)
                {
                }
                actionref("All Applications_Promoted"; "All Applications")
                {
                }
            }
            group(Category_Category4)
            {
                actionref("Failed Education_Promoted"; "Failed Education")
                {
                }
                actionref("Failed Management Experience_Promoted"; "Failed Management Experience")
                {
                }
                actionref("Failed Work Experience_Promoted"; "Failed Work Experience")
                {
                }
            }
            group(Category_Category5)
            {
                actionref("Candidate Shortlist Committee_Promoted"; "Candidate Shortlist Committee")
                {
                }
            }
        }
    }

    var
        Recruitment: Codeunit Recruitment;
}

#pragma implicitwith restore


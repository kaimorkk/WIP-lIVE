page 50031 "Performance Management RTC"
{
    Caption = 'Performance Management Role Center';
    PageType = RoleCenter;
    layout
    {
        area(rolecenter)
        {
            part("Performance Activities Cue"; "Performance Activities Cue")
            {
                ApplicationArea = Basic, Suite;
            }

            part("HR Activities Cue"; "HR Activities Cue")
            {
                Caption = 'HUMAN RESOURCE ACTIVITIES';
                ApplicationArea = Basic, Suite;
                Visible = false;
            }
            part(Control1904652008; "HR Manager Activities")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            // part("Document Approvals";"document appro")
            systempart(Control1000000050; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1901420308; Outlook)
            {
                ApplicationArea = Basic;
            }

            group(Control1900724708)
            {
                part(Control21; "My Job Queue")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
            }
        }
    }
    actions
    {
        area(Sections)
        {

            group("Setups")
            {
                action(HRAppraisalPeriods)
                {
                    Caption = 'Review Periods';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Review Periods";
                }
                action(Positions)
                {
                    Caption = 'Positions';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page Positions;
                }
                action(HRAppraisalSetup)
                {
                    Caption = 'SPM Setup';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Strategy General Setup";
                }
                action("Key Performance Indicators")
                {
                    Caption = 'Key Performance Indicators';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Key Performance Indicators";

                }
                action("Performance Management Plans")
                {
                    Caption = 'Performance Management Plans';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Performance Management Plans";
                }
                action(HRAppraisalDepartments)
                {
                    Caption = 'Appraisal Award Types';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Appraisal Award Types";

                }


                action("Performance Evaluation Template")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Perfomance Evaluation Template";
                }
                // action("Competency Perfomance Template")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Page 80108;
                // }
                action("Performance Rating Scale")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Perfomance Rating Scales";
                }
                action("HR Appraisal Unit of Measure")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "HR Appraisal Unit of Measure";
                }
                action("Proficiency Rating Scale")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Proficiency Scale Line";
                    Visible = false;

                }
                action("Appraisal Questionnaire Template")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Appraisal Questionnaire Temp";
                    Visible = false;
                }
                action("Performance Policy & Guidelines")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Policy & Guidelines";
                    Visible = false;

                }
            }
            group("Target Setting & Reporting")
            {
                Caption = 'Performance Planning';
                action("Strategic Plans")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Corporate Strategic Plans';
                    RunObject = Page "Corporate Strategic Plans";
                    ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                }
                action("Released Strategic Plans")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approved Corporate Strategic Plans';
                    RunObject = Page "Released Corp Str Plans";
                    ToolTip = 'Opens the released corporate strategic plans list page.';
                }
                action("Corporate Annual Workplans")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Corporate Annual Workplans';
                    RunObject = Page "Annual Strategy Workplans";
                    ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                }
                action("Annual Performance Contract")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Annual Performance Contract';
                    Visible = false;
                    RunObject = Page "Board/Executive PCs";
                    ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                }
                action("Functional Annual Work Plans")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                    Caption = 'Functional Annual Work Plans';
                    RunObject = Page "Functional/Operational PCs";
                    ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                }

                action("Annual Strategic Plan")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Consolidated Annual Work Plans';
                    RunObject = Page "Annual Strategy Workplans";
                    ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                }
                // action("Board Annual Workplan")
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Board Annual Workplan';
                //     RunObject = Page "Board/Executive PCs";
                //     Visible = false;

                //     ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                // }
                // action("DG/CEO Annual Workplan")
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'DG/CEO Annual Workplan';
                //     RunObject = Page "CEO/Corporate PCs";
                //     Visible = FALSE;
                //     ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                // }
                action("Functional Objective Templates")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Functional Objective Templates';
                    Visible = false;
                    RunObject = Page "Functional/Operational PCs";
                    ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                }


            }
            group("Performance Management & Measurement Understanding")
            {
                action("Directors Annual Workplan")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'PMMU';
                    RunObject = Page "Directors Perfomance Contracts";
                    ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                }
                action("Department/Region Annual Workplan")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Performance Appraisal System';
                    RunObject = Page "Departments\Centers PCs";
                    Visible = false;

                }
                /* action("Principal Officer Annual Workplan")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Principal Officer PMMU  Workplan';
                    RunObject = Page "Related Policies";
                }
                action("Senior Officer Annual Workplan")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Senior Officer PMMU Annual Workplan';
                    RunObject = Page "Policy Thematic Area Revision";

                } */
                action("Staff Annual Workplan")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Performance Appraisal System';
                    RunObject = Page "Individual Scorecards";

                }
            }
            group("Performance Appraisal")
            {
                group("Standard Appraisal")
                {
                    action(Q1Requests)
                    {
                        Caption = 'Standard Appraisal';
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Standard Perfomance Appraisal";
                    }
                    action(Q2Requests)
                    {
                        Caption = 'Standard Appraisal-Evaluation';
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Standard Perform Appraisal-E";
                    }
                    action(Q3Requests)
                    {
                        Caption = 'Submitted Standard Appraisal';
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Standard Appraisal-Submitted";
                    }
                    action(Q4Requests)
                    {
                        Caption = 'Closed Standard Appraisal';
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Standard Appraisal-Closed";
                    }
                }
                group("Employee-Supervisor Appraisal")
                {
                    action("Self-Supervisor")
                    {
                        Caption = 'Self-Supervisor Appraisal';
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Self-Supervisor Appraisals";
                    }
                    action("Self-Supervisor Evaluation")
                    {
                        Caption = 'Self-Supervisor Under Evaluation';
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Self-Supervisor Appraisals-E";
                    }
                    action("Self-Supervisor Submitted")
                    {
                        Caption = 'Submitted Self-Supervisor Appraisal';
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Self-Supervisor Appraisals-Sub";
                    }
                    action("Self-Supervisor Closed")
                    {
                        Caption = 'Closed Self-Supervisor Appraisal';
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "SelfSupervisorAppraisal-Closed";
                    }
                }

                /*                 group("Performance Contracts")
                                {
                                    action("Directors Annual Workplan")
                                    {
                                        ApplicationArea = Basic, Suite;
                                        Caption = 'Directors Annual Workplan';
                                        RunObject = Page "Directors Perfomance Contracts";
                                        ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                                    }
                                    action("Department/Region Annual Workplan")
                                    {
                                        ApplicationArea = Basic, Suite;
                                        Caption = 'Department/Region Annual Workplan';
                                        RunObject = Page 80366;

                                    }
                                    action("Principal Officer Annual Workplan")
                                    {
                                        ApplicationArea = Basic, Suite;
                                        Caption = 'Principal Officer Annual Workplan';
                                        RunObject = Page 80409;
                                    }
                                    action("Senior Officer Annual Workplan")
                                    {
                                        ApplicationArea = Basic, Suite;
                                        // Caption ='Functional Objective Template';
                                        RunObject = Page 80411;

                                    }
                                    action("Staff Annual Workplan")
                                    {
                                        ApplicationArea = Basic, Suite;
                                        // Caption ='Functional Objective Template';
                                        RunObject = Page 80082;

                                    }
                                } */

                group("360 Degree Appraisal")
                {
                    action("360 Degree")
                    {
                        Caption = '360 Degree Appraisal';
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Group Appraisals";
                    }
                    action("Group Appraisal Under")
                    {
                        Caption = 'Group Appraisal Under Evaluation';
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Group Appraisal-Evaluations";
                    }
                    action("Submitted Group Appraisal")
                    {
                        Caption = 'Submitted Group Appraisal';
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Group Appraisal-Submitted";
                    }
                    action("Closed Group Appraisal")
                    {
                        Caption = 'Closed Group Appraisal';
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Group Appraisal-Closed";
                    }
                }

                // group("Budget Allignment")
                // {
                //     action("Budget Allignment List")
                //     {
                //         ApplicationArea = Basic, Suite;
                //         // Caption ='Functional Objective Template';
                //         // RunObject = Page "Budget Consolidation List";
                //     }
                // }
                group(Archive)
                {
                    action("Approved Annual Plan")
                    {
                        ApplicationArea = Basic, Suite;
                        // Caption ='Functional Objective Template';
                        // RunObject = Page  ;

                    }
                    action("Approved Strategic Plan")
                    {
                        ApplicationArea = Basic, Suite;
                        // Caption ='Functional Objective Template';
                        RunObject = Page 80193;

                    }
                    action("Approved Departmental Workplans")
                    {
                        ApplicationArea = Basic, Suite;
                        // Caption ='Functional Objective Template';
                        //  RunObject = Page "Approved Dept Annual Workplans";
                    }

                    action("Approved Annual Work Plans")
                    {
                        ApplicationArea = Basic, Suite;
                        // Caption ='Functional Objective Template';
                        RunObject = Page 80197;

                    }

                    action("Approved Board Annual Work Plans")
                    {
                        ApplicationArea = Basic, Suite;
                        // Caption ='Functional Objective Template';
                        //  RunObject = Page 99408;
                        Visible = false;

                    }
                    action("Approved Functional Objective Templates")
                    {
                        ApplicationArea = Basic, Suite;
                        // Caption ='Functional Objective Template';
                        RunObject = Page 80361;

                    }
                    action("Appoved Directors Annual Workplans")
                    {
                        ApplicationArea = Basic, Suite;
                        // Caption ='Functional Objective Template';
                        RunObject = Page 80379;

                    }
                    action("Approved Departmental/Region Annual Workplans")
                    {
                        ApplicationArea = Basic, Suite;
                        // Caption ='Functional Objective Template';
                        RunObject = Page 80378;


                    }
                    action("Approved  Strategic Plans")
                    {
                        ApplicationArea = Basic, Suite;
                        // Caption ='Functional Objective Template';
                        RunObject = Page 80193;

                    }
                    action("Approved Staff Annual Workplan")
                    {
                        ApplicationArea = Basic, Suite;
                        // Caption ='Functional Objective Template';
                        RunObject = Page 80363;

                    }
                }

            }
            group(PayrollGroup)
            {
                Caption = 'PCA';
                Image = AdministrationSalesPurchases;

                action("Open Paychange Advice")
                {
                    Caption = 'Open Paychange Advice';
                    ApplicationArea = basic;
                    RunObject = Page "prPCA list";
                    RunPageView = where(Status = filter(Open));
                }
                action("Pending Paychange Advice")
                {
                    Caption = 'Pending Paychange Advice';
                    ApplicationArea = basic;
                    RunObject = Page "prPCA list";
                    RunPageView = where(Status = filter("Pending Approval"));
                }
                action("Approved Paychange Advice")
                {
                    Caption = 'Approved Paychange Advice';
                    ApplicationArea = basic;
                    RunObject = Page "prPCA list";
                    RunPageView = where(Status = filter(Approved));
                }

            }
            group("Reports")
            {
                action("Annual Appraisal Form")
                {
                    Caption = 'Annual Appraisal Form';
                    ApplicationArea = basic;
                    RunObject = Report "Annual Appraisal Form";

                }
                action("Performance Appraisal Form")
                {
                    Caption = 'Performance Appraisal Form';
                    ApplicationArea = basic;
                    RunObject = Report "Performance Appraisal";

                }
                action("Performance Appraisal Report")
                {
                    Caption = 'Performance Appraisal Report';
                    ApplicationArea = basic;
                    RunObject = Report "Performance Appraisal Report";

                }
                action("Performance Appraisal History")
                {
                    ApplicationArea = basic;
                    RunObject = Report "Performance Appraisal History";
                }
                action("Performance Contract Report")
                {
                    Caption = 'PMMU Report';
                    ApplicationArea = basic;
                    RunObject = Report "Performance Contracts";

                }
                action("Performance Contract Reports")
                {
                    Caption = 'Individual Score Card Report';
                    ApplicationArea = basic;
                    RunObject = Report "PERFORMANCE CONTRACT-IND";

                }
                action("Performance Awards")
                {
                    Caption = 'Performance Awards';
                    ApplicationArea = basic;
                    RunObject = Report "Perfomance Rewards";

                }

            }

        }
    }


}


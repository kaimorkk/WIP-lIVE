
table 69706 "Candidate Selection Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'Candidate Shortlisting,Interview Invitation,Consolidated Interview Report,Invitation for Orientation,Individual Candidate Shortlist';
            OptionMembers = "Candidate Shortlisting","Interview Invitation","Consolidated Interview Report","Invitation for Orientation","Individual Candidate Shortlist";
        }
        field(2; "Document No."; Code[30])
        {
        }
        field(3; "Source Type"; Option)
        {
            OptionCaption = ' ,Final Shortlisting,Previous Interview';
            OptionMembers = " ","Final Shortlisting","Previous Interview";
        }
        field(4; "Source Document No."; Code[30])
        {
            TableRelation = if ("Source Type" = filter("Final Shortlisting")) "Candidate Selection Header"."Document No." where("Document Type" = filter("Candidate Shortlisting"),
                                                                                                                               "Vacancy ID" = field("Vacancy ID"))
            else
            if ("Source Type" = filter("Previous Interview")) "Candidate Selection Header"."Document No." where("Document Type" = filter("Interview Invitation"),
                                                                                                                                                                                                                                       "Vacancy ID" = field("Vacancy ID"),
                                                                                                                                                                                                                                       Posted = filter(true));
        }
        field(5; "Interview Invitation No."; Code[30])
        {
            TableRelation = "Candidate Selection Header"."Document No.";
        }
        field(6; "Document Date"; Date)
        {
        }
        field(7; "Candidate Shortlist No."; Code[30])
        {
        }
        field(8; "Ability Test Report ID"; Code[30])
        {
        }
        field(9; "Phone Interview ID"; Code[30])
        {
        }
        field(10; "Vacancy ID"; Code[30])
        {
            TableRelation = "Recruitment Requisition Header";

            trigger OnValidate()
            begin
                RequisitionHeader.Reset;
                RequisitionHeader.SetRange("Document No.", "Vacancy ID");
                if RequisitionHeader.FindFirst then begin
                    Description := Format(RequisitionHeader."Document Type") + ' ' + RequisitionHeader."Job Title/Designation";
                    "No. of openings" := RequisitionHeader."No of Openings";
                    RequisitionHeader.CalcFields("No. of Applications");
                    "No. of Submitted Applications" := RequisitionHeader."No. of Applications";
                    Region := RequisitionHeader.Region;
                    "Employment Type" := RequisitionHeader."Employment Type";
                    "Position ID" := RequisitionHeader."Position ID";
                    Validate("Position ID");
                    "Job Title" := RequisitionHeader."Job Title/Designation";
                    "Planned end Date" := RequisitionHeader."Planned Recruitment End Date";
                    "Planned Start Date" := RequisitionHeader."Planned Recruitment Start Date";
                    Directorate := RequisitionHeader.Directorate;
                    Department := RequisitionHeader.Department;
                    "Default Terms of Service Code" := RequisitionHeader."Default Terms of Service Code";
                    "Application Closing Date" := RequisitionHeader."Application Closing Date";
                    "Application Closing Time" := RequisitionHeader."Application Closing Time";
                    "Seniority Level" := RequisitionHeader."Seniority Level";
                    Region := RequisitionHeader.Region;
                end
            end;
        }
        field(11; "Appointed Selection Comm ID"; Code[30])
        {
            TableRelation = "Commitee Appointment Voucher";

            trigger OnValidate()
            begin
                CommiteeAppointedMember.Reset;
                CommiteeAppointedMember.SetRange("Document No.", "Appointed Selection Comm ID");
                if CommiteeAppointedMember.FindSet then begin
                    repeat
                        CandidateSelectionCommittee.Init;
                        CandidateSelectionCommittee."Document No." := "Document No.";
                        CandidateSelectionCommittee."Appointed Committee ID" := CommiteeAppointedMember."Document No.";
                        CandidateSelectionCommittee."Member No." := CommiteeAppointedMember."Member No.";
                        CandidateSelectionCommittee.Name := CommiteeAppointedMember."Member Name";
                        CandidateSelectionCommittee.Role := CommiteeAppointedMember.Role;
                        CandidateSelectionCommittee."Phone No." := CommiteeAppointedMember."Telephone No.";
                        CandidateSelectionCommittee.Email := CommiteeAppointedMember."Member Email";
                        CandidateSelectionCommittee."Staff No." := CommiteeAppointedMember."Staff No.";
                        CandidateSelectionCommittee.Designation := CommiteeAppointedMember.Designation;
                        CandidateSelectionCommittee.Insert(true);
                    until CommiteeAppointedMember.Next = 0;
                end;
            end;
        }
        field(12; "Selection Committee Chair"; Code[30])
        {
            TableRelation = "Candidate Selection Committee"."Member No." where(Role = filter(Chairperson), "Document No." = field("Document No."),
                                                                                "Appointed Committee ID" = field("Appointed Selection Comm ID"));
        }
        field(13; "Lead HR Officer"; Code[30])
        {
            TableRelation = "HR Officers"."Employee No.";
        }
        field(14; Description; Text[250])
        {
        }
        field(15; "Primary Contact Person"; Text[50])
        {
        }
        field(16; "Primary Contact Phone"; Text[30])
        {
        }
        field(17; "Primary Contact Email"; Text[30])
        {
        }
        field(18; "Additional Comments"; Text[50])
        {
        }
        field(19; "Interview Mode"; Option)
        {
            OptionCaption = ' ,Physical(Face to Face),Phone Interview,Online';
            OptionMembers = " ","Physical(Face to Face)","Phone Interview",Online;
        }
        field(20; "Position ID"; Code[30])
        {
            TableRelation = "Company Positions";

            trigger OnValidate()
            begin
                CompanyPositions.Reset;
                CompanyPositions.SetRange("Position ID", "Position ID");
                if CompanyPositions.FindFirst then begin
                    "Job Title" := CompanyPositions."Job Title";
                    Directorate := CompanyPositions.Directorate;
                    Department := CompanyPositions.Department;
                    "Seniority Level" := CompanyPositions."Seniority Level";
                    "Default Terms of Service Code" := CompanyPositions."Default Terms of Service";
                    "Minimum Academic Qualification" := CompanyPositions."Minimum Academic Qualification";
                    Validate("Minimum Academic Qualification");
                    "Minimum Mngmnt Experience" := CompanyPositions."Minimum Mngmnt Experience";
                    "Minimum Work Experience" := CompanyPositions."Minimum Work Experience"
                end
            end;
        }
        field(21; "Job Title"; Text[150])
        {
        }
        field(22; "No. of openings"; Integer)
        {
        }
        field(23; Directorate; Code[30])
        {
        }
        field(24; Department; Code[30])
        {
        }
        field(25; Region; Code[30])
        {
        }
        field(26; "Seniority Level"; Option)
        {
            OptionCaption = ',Entry-Level,Mid-Level,Senior Level,Executive';
            OptionMembers = ,"Entry-Level","Mid-Level","Senior Level",Executive;
        }
        field(27; "Default Terms of Service Code"; Code[30])
        {
        }
        field(28; "Employment Type"; Option)
        {
            OptionCaption = 'Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer';
            OptionMembers = Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer;
        }
        field(29; "Application Closing Date"; Date)
        {
        }
        field(30; "Application Closing Time"; Time)
        {
        }
        field(31; "Minimum Academic Qualification"; Code[30])
        {
            TableRelation = Qualification where("Qualification Category" = filter(Academic),
                                                 Blocked = filter(false));

            trigger OnValidate()
            begin
                if Qualification.Get("Minimum Academic Qualification") then
                    "Min Academic Hierarchy Pointer" := Qualification."Academic Hierachy Code";
            end;
        }
        field(32; "Min Academic Hierarchy Pointer"; Integer)
        {
            Editable = false;
        }
        field(33; "Minimum Work Experience"; Integer)
        {
        }
        field(34; "Minimum Mngmnt Experience"; Integer)
        {
            Caption = 'Minimum Management Experience';
        }
        field(35; "Shortlisting Venue"; Text[150])
        {
        }
        field(36; "Planned Start Date"; Date)
        {
        }
        field(37; "Planned end Date"; Date)
        {
        }
        field(38; "No. of Submitted Applications"; Integer)
        {
            CalcFormula = count("Job Applications" where("Vacancy Id" = field("Vacancy ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(39; "No. of Apptitude Invitees"; Integer)
        {
            CalcFormula = count("PreScreening Line" where("Vacancy ID" = field("Vacancy ID"),
                                                           "Document Type" = filter("Ability Test Invitation")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(40; "No. of Final Shortlisted Candi"; Integer)
        {
            CalcFormula = count("Candidate Shortlist Matrix" where("Document Type" = field("Document Type"), "Document No" = field("Document No."), "Vacancy ID" = field("Vacancy ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(41; "Missed Academic Total"; Integer)
        {
            CalcFormula = count("Shortlist Failed Academic" where("Vacancy ID" = field("Vacancy ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(42; "Missed Management Total"; Integer)
        {
            CalcFormula = count("Shortlist Failed Management" where("Vacancy ID" = field("Vacancy ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(43; "Missed General Total"; Integer)
        {
            CalcFormula = count("Shortlist Failed General" where("Vacancy ID" = field("Vacancy ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(44; "Document Status"; Option)
        {
            Editable = false;
            OptionCaption = 'Active,Cancelled,Pending Consolidation,Closed';

            OptionMembers = Active,Cancelled,"Pending Consolidation",Closed;
        }
        field(45; "Created By"; Code[30])
        {
            Editable = false;
        }
        field(46; "Created On"; DateTime)
        {
            Editable = false;
        }
        field(47; Posted; Boolean)
        {
            Editable = false;
        }
        field(48; "No. Series"; Code[30])
        {
        }
        field(49; "Interview Scoresheet Template"; Code[30])
        {
            TableRelation = "HR Screening Template".Code where("Template Type" = filter("Interview Scoresheet"));
        }
        field(50; "Shortlisting Type"; Option)
        {
            OptionCaption = '...,Mandatories Only';
            OptionMembers = "...","Mandatories Only";
        }
        field(51; "Member No."; Code[30])
        {
            TableRelation = "Candidate Selection Committee"."Member No." where("Document No." = field("Document No."), "Appointed Committee ID" = field("Appointed Selection Comm ID"));
        }

        field(52; "Shorlisting Document No."; Code[30])
        {
            TableRelation = "Candidate Selection Header"."Document No." where("Document Type" = filter("Candidate Shortlisting"), "Document Status" = filter("Pending Consolidation"),
                                                                                                                               "Vacancy ID" = field("Vacancy ID"));
        }
        field(53; "Shortlist Generated"; Boolean)
        {
        }
        field(54; "Shortlist Generated By"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        HRSetup.Get;
        if "Document Type" = "document type"::"Candidate Shortlisting" then begin
            HRSetup.TestField("Shortlisting Voucher Nos.");
            if "Document No." = '' then
                NoSeriesMgt.InitSeries(HRSetup."Shortlisting Voucher Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;
        if "Document Type" = "document type"::"Consolidated Interview Report" then begin
            HRSetup.TestField("Interview Report Nos.");
            if "Document No." = '' then
                NoSeriesMgt.InitSeries(HRSetup."Interview Report Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");

        end;
        if "Document Type" = "document type"::"Interview Invitation" then begin
            HRSetup.TestField("Interview Invitation Nos.");
            if "Document No." = '' then
                NoSeriesMgt.InitSeries(HRSetup."Interview Invitation Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");

        end;
        //"Orientation Invitation Nos."
        if "Document Type" = "document type"::"Invitation for Orientation" then begin
            HRSetup.TestField("Orientation Invitation Nos.");
            if "Document No." = '' then
                NoSeriesMgt.InitSeries(HRSetup."Orientation Invitation Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");

        end;
        //"Individual Shortlist Nos."

        if "Document Type" = "document type"::"Individual Candidate Shortlist" then begin
            HRSetup.TestField("Individual Shortlist Nos.");
            if "Document No." = '' then
                NoSeriesMgt.InitSeries(HRSetup."Individual Shortlist Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");

        end;


        "Created By" := UserId;
        "Created On" := CurrentDatetime;
        "Document Date" := Today;
    end;

    var
        Qualification: Record Qualification;
        CompanyPositions: Record "Company Positions";
        RequisitionHeader: Record "Recruitment Requisition Header";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRSetup: Record "Human Resources Setup";
        CommiteeAppointedMember: Record "Commitee Appointed Member";
        CandidateSelectionCommittee: Record "Candidate Selection Committee";
}


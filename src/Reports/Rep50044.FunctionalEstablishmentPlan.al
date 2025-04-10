report 50044 "Functional Establishment Plan"
{
    Caption = 'Functional Establishment Plan';
    dataset
    {
        dataitem(StaffEstablishmentPlan; "Staff Establishment Plan")
        {
            DataItemTableView = where("Establishment Type" = filter(Functional));
            RequestFilterFields = Code, "Effective Date", "Created By";
            column(CompanyInfo_Name; CompanyInfo.Name)
            {
            }
            column(CompanyInfo_Address; CompanyInfo.Address)
            {
            }
            column(CompanyInfo_Address2; CompanyInfo."Address 2")
            {
            }
            column(website; CompanyInfo."Home Page")
            {
            }
            column(email; CompanyInfo."E-Mail")
            {
            }
            column(CompanyInfo_City; CompanyInfo.City)
            {
            }
            column(CompanyInfo_Phone; CompanyInfo."Phone No.")
            {
            }
            column(CompanyInfo_Fax; CompanyInfo."Fax No.")
            {
            }
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(VATREG; CompanyInfo."VAT Registration No.")
            {
            }
            column(Header_Code; "Code")
            {
            }
            column(Header_CreatedBy; "Created By")
            {
            }
            column(Header_CreatedOn; "Created On")
            {
            }
            column(Header_CreatedTime; "Created Time")
            {
            }
            column(Header_Description; Description)
            {
            }
            column(Header_DutyStation; "Duty Station")
            {
            }

            column(Header_EffectiveDate; "Effective Date")
            {
            }
            column(Header_EstablishmentType; "Establishment Type")
            {
            }
            column(Header_ExternalDocumentNo; "External Document No.")
            {
            }
            column(Header_NoofRecruitmentPlans; "No. of Recruitment Plans")
            {
            }
            column(Header_StationName; "Station Name")
            {
            }
            column(Header_Status; Status)
            {
            }
            column(Header_TotalStaffEstablishment; "Total Staff Establishment")
            {
            }
            column(ApproversName1; ApproversName[1])
            {
            }
            column(ApproversName2; ApproversName[2])
            {
            }
            column(ApproversName3; ApproversName[3])
            {
            }
            column(ApproversName4; ApproversName[4])
            {
            }
            column(ApproversName5; ApproversName[5])
            {
            }
            column(ApproversName6; ApproversName[6])
            {
            }
            column(ApproversName7; ApproversName[7])
            {
            }
            column(ApprovalDate1; ApprovalDate[1])
            {
            }
            column(ApprovalDate2; ApprovalDate[2])
            {
            }
            column(ApprovalDate3; ApprovalDate[3])
            {
            }
            column(ApprovalDate4; ApprovalDate[4])
            {
            }
            column(ApprovalDate5; ApprovalDate[5])
            {
            }
            column(ApprovalDate6; ApprovalDate[6])
            {
            }
            column(ApprovalDate7; ApprovalDate[7])
            {
            }
            column(Sign1; UserRec1[1]."User Signature")
            {
            }
            column(Sign2; UserRec1[2]."User Signature")
            {
            }
            column(Sign3; UserRec1[3]."User Signature")
            {
            }
            column(Sign4; UserRec1[4]."User Signature")
            {
            }
            column(Sign0; UserRec0."User Signature")
            {
            }
            column(Sign6; UserRec1[6]."User Signature")
            {
            }
            column(Sign5; UserRec1[5]."User Signature")
            {
            }
            column(Sign7; UserRec1[7]."User Signature")
            {
            }

            dataitem(EstablishmentPlanPosition; "Establishment Plan Position")
            {
                DataItemLink = "Staff Establishment Code" = field(Code);
                column(Lines_ActualActive; "Actual Active")
                {
                }
                column(Lines_ActualSuspended; "Actual Suspended")
                {
                }
                column(Lines_ActualTerminated; "Actual Terminated")
                {
                }
                column(Lines_ApprovedNo; "Approved No.")
                {
                }
                column(Lines_CadreCode; "Cadre Code")
                {
                }
                column(Lines_CadreType; "Cadre Type")
                {
                }
                column(Lines_CurrentNoFunctional; "Current No Functional")
                {
                }
                column(Lines_DepartmentCode; "Department Code")
                {
                }
                column(Lines_DesignationGroup; "Designation Group")
                {
                }
                column(Lines_DirectorateCode; "Directorate Code")
                {
                }
                column(Lines_JobID; "Job ID")
                {
                }
                column(Lines_JobTitle; "Job Title")
                {
                }
                column(Lines_PositionCategory; "Position Category")
                {
                }
                column(Lines_StaffEstablishmentCode; "Staff Establishment Code")
                {
                }
                column(Lines_Status; Status)
                {
                }
                column(Lines_Variance; Variance)
                {
                }
                column(Lines_YearCode; "Year Code")
                {
                }
            }
            trigger OnAfterGetRecord()
            begin
                ApprovalEntry.Reset;
                ApprovalEntry.SetRange(ApprovalEntry."Document No.", Code);
                ApprovalEntry.SetRange(ApprovalEntry.Status, ApprovalEntry.Status::Approved);
                //ApprovalEntry.SETFILTER(ApprovalEntry."Approval Code",'LPO');
                if ApprovalEntry.Find('-') then begin
                    UserRec0.Get(ApprovalEntry."Sender ID");
                    PrebBy := UserRec0.UserName;
                    UserRec0.CalcFields(UserRec0."User Signature");
                    PrebDate := ApprovalEntry."Last Date-Time Modified";
                    repeat
                        UserRec.Get(ApprovalEntry."Approver ID");
                        ApproversName[ApprovalEntry."Sequence No."] := UserRec.UserName;
                        ApprovalDate[ApprovalEntry."Sequence No."] := ApprovalEntry."Last Date-Time Modified";
                        UserRec1[ApprovalEntry."Sequence No."].Get(ApprovalEntry."Approver ID");
                        UserRec1[ApprovalEntry."Sequence No."].CalcFields(UserRec1[ApprovalEntry."Sequence No."]."User Signature");
                    until ApprovalEntry.Next = 0;
                end;

            end;

        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture)
    end;

    var
        CompanyInfo: Record "Company Information";
        CopyText: Text;
        Sign: Text[100];
        i: Integer;
        ApprovalEntry: Record "Posted Approval Entry";
        ApproversName: array[10] of Text[100];
        ApprovalDate: array[10] of DateTime;
        ApproversSignature: array[10] of Guid;
        UserRec: Record "User Setup";
        UserRec1: array[10] of Record "User Setup";
        PrebBy: Text[100];
        UserRec0: Record "User Setup";

        PrebDate: DateTime;

}

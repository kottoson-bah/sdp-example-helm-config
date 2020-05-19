# Copyright © 2018 Booz Allen Hamilton. All Rights Reserved.
# This software package is licensed under the Booz Allen Public License. The license can be found in the License file or at http://boozallen.github.io/licenses/bapl

{{/* Determines Namespace Based on Ephemerality */}}
{{- define "determine_namespace" }}
{{- if .Values.is_ephemeral }}
namespace: {{ .Release.Name }}
{{- else }}
namespace: {{ .Values.namespace }}
{{- end }}
{{- end }}

{{/* Determines the image tag to use */}}
{{- define "determine_image_tag" }}
{{- $reponame := .RepoName -}}
{{- range .Repos }}
{{- if eq .name $reponame }}
{{- .sha }}
{{- end }}
{{- end }}
{{- end }}
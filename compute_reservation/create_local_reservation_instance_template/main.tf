/**
 * Copyright 2023 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

# [START compute_reservation_create_local_reservation_instance_template]

resource "google_compute_reservation" "default" {
  name = "gce-reservation-local"
  zone = "us-central1-a"

  /**
   * To specify a single-project reservation, omit the share_settings block
   * (default) or set the share_type field to LOCAL.
   */
  share_settings {
    share_type = "LOCAL"
  }

  /**
   * To use the source_instance_template field, you must omit the
   * instance_properties block. Attempting to use the instance_properties
   * block together with the source_instance_template field causes issues.
   */
  specific_reservation {
    count                    = 1
    source_instance_template = "example-instance-template"
  }

  /**
   * To let VMs with affinity for any reservation consume this reservation, omit
   * the specific_reservation_required field (default) or set it to false.
   */
  specific_reservation_required = false
}

# [END compute_reservation_create_local_reservation_instance_template]
